package eshop

import grails.events.Listener

class EventsService {

    @Listener(namespace='browser')
    order_event(Map data){
        //...
        event('order_event', data) // will trigger registered browsers on 'savedTodo' topic
    }
}
