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
        if (params.id) {
            deliveryTargetZoneInstance = DeliveryTargetZone.get(params.id)
            deliveryTargetZoneInstance.properties = params
        } else
            deliveryTargetZoneInstance = new DeliveryTargetZone(params)

        deliveryTargetZoneInstance.cities.clear()
        deliveryTargetZoneInstance.cities.addAll(City.findAllByIdInList(params.cities.collect { it.toLong() }.toList()))

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
