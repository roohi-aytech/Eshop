package eshop

class AddedValueSubType {
    String title
    AddedValueType addedValueType

    Boolean deleted
    Integer indx

    static hasMany = [addedValues: AddedValue]
    static transients = ['deleted']

    static belongsTo = [AddedValueType]
    static constraints = {
    }
}
