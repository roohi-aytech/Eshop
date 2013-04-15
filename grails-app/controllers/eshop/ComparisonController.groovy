package eshop

class ComparisonController {

    def priceService

    def add() {
        def id = params.id
        def product = Product.get(id)

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            compareList = [];
        def compareListItem = compareList.find { it -> it.id == id }
        if (!compareListItem){
            compareListItem = [id:id, title:product.toString(), price: priceService.calcProductPrice(product.id).mainVal]
            compareList << compareListItem
        }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)
        render "1"
    }

    def remove() {
        def id = params.id

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            render "compareList is empty";
        compareList = compareList.findAll { it -> !(it.id == id) }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)
        render "1"
    }
}
