register_command('hirejudge', 

    array(
        'description': 'Hire\'s a Player as a judge',
        'usage': '/hirejudge <player>',
        'permission': 'hire.judge',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure(@alias, @sender, @args) {
        
            if (array_size(@args) != 1) {
                return(false)
            }
            
            @player = player()
            @vic = player(@args[0])
            
            if(has_permission(@vic,'donot.hire')){
                msg(color('RED').'Sorry, that person can no longer be hired')
                die()
            }
            include('/home/minecraft/server/plugins/CommandHelper/includes/checkJobs.ms')
            if(!_checkJobs(@vic)){
                die()
            }

            runas('~console',"/pex user ".@vic." add is.judge")
            runas('~console',"/pex user ".@vic." group add judge")
            tmsg(@player,color('RED')."You have hired ".@vic. " as a judge!")
            tmsg(@vic,color('RED')."You have been hired as a judge!")
        }
    )
)

register_command('firejudge', 

    array(
        'description': 'Fire\'s a Player as a Judge',
        'usage': '/firejudge <player>',
        'permission': 'fire.judge',
        'noPermMsg': 'Sorry you don\'t have permission to use this command.',
        'executor': closure(@alias, @sender, @args) {
        
            if (array_size(@args) != 1) {
                return(false)
            }
            
            @player = player()
            @vic = player(@args[0])
            
            runas('~console',"/pex user ".@vic." remove is.judge")
            runas('~console',"/pex user ".@vic." group remove judge")
            runas('~console',"/warp city ".@vic)
            tmsg(@player,color('RED')."You have fired ". @vic ." from judge!")
            tmsg(@vic,color('RED')."You have been fired from judge!")
        }
    )
)
