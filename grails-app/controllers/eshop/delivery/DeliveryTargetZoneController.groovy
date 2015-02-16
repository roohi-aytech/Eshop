package eshop.delivery

import eshop.City
import eshop.Province
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class DeliveryTargetZoneController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def deliveryTargetZoneInstance
        if (params.id)
            deliveryTargetZoneInstance = DeliveryTargetZone.get(params.id)
        else
            deliveryTargetZoneInstance = new DeliveryTargetZone()
        render(template: "form", model: [deliveryTargetZoneInstance: deliveryTargetZoneInstance])
    }

    def list() {
    }

    def save() {
        def deliveryTargetZoneInstance
        def cities = params.cities
        params.cities = null

        if (params.id) {
            deliveryTargetZoneInstance = DeliveryTargetZone.get(params.id)
            deliveryTargetZoneInstance.properties = params
        } else
            deliveryTargetZoneInstance = new DeliveryTargetZone(params)

        deliveryTargetZoneInstance.cities?.clear()
        if (cities instanceof String)
            deliveryTargetZoneInstance.addToCities(City.get(cities.toLong()))
        else
            City.findAllByIdInList(cities.findAll{it.toString().indexOf('p') == -1}.collect { it.toLong() }.toList()).each{
                deliveryTargetZoneInstance.addToCities(it)
            }

        if (deliveryTargetZoneInstance.validate() && deliveryTargetZoneInstance.save()) {
            render deliveryTargetZoneInstance as JSON
        } else
            render(template: "form", model: [deliveryTargetZoneInstance: deliveryTargetZoneInstance])
    }

    def delete() {
        def deliveryTargetZoneInstance = DeliveryTargetZone.get(params.id)
        deliveryTargetZoneInstance.deleted = true
        deliveryTargetZoneInstance.save()
        render 0
    }

    def cityTree() {
        def selectedCityIdList = DeliveryTargetZone.get(params["deliveryTargetZoneId"])?.cities?.collect { it.id.toLong() }
        render Province.findAll().collect { province ->
            [id: 'p' + province.id, text: province.title, state: province.cities
                    .any { c -> selectedCityIdList.any { it == c.id } } ? 'open' : 'closed', children: province.cities.collect { city ->
                [id: city.id, text: city.title, checked: selectedCityIdList?.contains(city.id)]
            }] as grails.converters.JSON
        }

    }
}
