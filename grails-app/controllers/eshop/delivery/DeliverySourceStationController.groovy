package eshop.delivery

import eshop.City
import eshop.Province
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class DeliverySourceStationController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def deliverySourceStationInstance
        if (params.id)
            deliverySourceStationInstance = DeliverySourceStation.get(params.id)
        else
            deliverySourceStationInstance = new DeliverySourceStation()
        render(template: "form", model: [deliverySourceStationInstance: deliverySourceStationInstance])
    }

    def list() {
    }

    def save() {
        def deliverySourceStationInstance
        if (params.id) {
            deliverySourceStationInstance = DeliverySourceStation.get(params.id)
            deliverySourceStationInstance.properties = params
        } else
            deliverySourceStationInstance = new DeliverySourceStation(params)



        if (deliverySourceStationInstance.validate() && deliverySourceStationInstance.save()) {
            render deliverySourceStationInstance as JSON
        } else
            render(template: "form", model: [deliverySourceStationInstance: deliverySourceStationInstance])
    }


    def delete() {
        def deliverySourceStationInstance = DeliverySourceStation.get(params.id)
        deliverySourceStationInstance.deleted = true
        deliverySourceStationInstance.save()
        render 0
    }

    def cityTree() {
        def selectedCityId = DeliverySourceStation.get(params["deliverySourceStationId"])?.city?.id
        render Province.findAll().collect { province ->
            [id: 'p' + province.id, text: province.title, state: province.cities.any {it.id == selectedCityId}?'open':'closed', children: province.cities.collect { city ->
                [id: city.id, text: city.title]
            }] as grails.converters.JSON
        }
    }
}
