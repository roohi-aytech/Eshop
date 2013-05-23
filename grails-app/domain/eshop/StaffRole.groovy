package eshop

class StaffRole {

    String role
    static constraints = {
        role()
    }

    static searchable = true

    String toString(){
        role
    }
}
