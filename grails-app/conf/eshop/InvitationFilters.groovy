package eshop

class InvitationFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if (params.invitation) {
                    def invitation = Invitation.findByIdentifier(params.invitation.toString())
                    if (invitation) {

                        if (!invitation.visitRecorded) {
                            invitation.visitRecorded = true
                            invitation.save()

                            //grant points to invitation sender
                        }

                        session['invitation'] = params.invitation
                    }
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
