bind('entity_damage',null,associative_array('cause':'PROJECTILE'),@event){
    if(@event['type'] == 'PLAYER'){
        @plr = @event['player']
        if(ponline(@plr)){
            if(has_permission(@plr,'powers.projectileinvulnerability')){
                cancel()
            }
        }

    }
}
