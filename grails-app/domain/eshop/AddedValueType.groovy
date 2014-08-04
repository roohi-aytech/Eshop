package eshop

class AddedValueType {
    String title
    String description
    boolean needDescription = false
    boolean hasCustomImage = false
    boolean hasAddedValueCount = false
    Double defaultPrice = 0D
    Content image
    static hasMany = [addedValues: AddedValue, productTypes: ProductType]
    static belongsTo = [ProductType]
    static constraints = {
        title()
        description(nullable: true)
        image(nullable: true)
        needDescription(nullable: true)
        hasCustomImage(nullable: true)
        hasAddedValueCount(nullable: true)
        defaultPrice(nullable: true)
    }
}
