package eshop

class User {

    transient springSecurityService

    String username
    String password
    String firstName
    String lastName
    String email
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        password blank: false
        firstName()
        lastName()
        email(email: true)

    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        if(this.id)
            return UserRole.findAllByUser(this).collect { it.role } as Set
        new HashSet();
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    String toString(){
        return firstName+" "+lastName
    }
}
