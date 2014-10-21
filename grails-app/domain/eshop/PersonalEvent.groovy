package eshop

class PersonalEvent {

    String title
    String fullName
    Relationship relationship
    String sex
    Date date
    String jobTitle
    String favoriteStyle
    Integer minPrice
    Integer maxPrice
    boolean emailNotification = false
    boolean smsNotification = false

    Customer customer

    static hasMany = [favoriteProductTypes: ProductType]

    static constraints = {
        title(nullable: true)
        fullName nullable: true
        relationship()
        sex nullable: true, inList: ['female', 'male']
        date()
        jobTitle nullable: true, inList: ['official', 'technical', 'self-employment', 'athlete', 'military', 'student', 'collegian', 'other']
        favoriteStyle nullable: true, inList: ['traditional', 'classic', 'modern']
        minPrice nullable: true
        maxPrice nullable: true
        emailNotification nullable: true
        smsNotification nullable: true

    }
}
