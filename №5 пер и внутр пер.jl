using HorizonSideRobots

r=Robot(animate=true,"korobka.sit")

function firstperimetr!(r::Robot)
    gotostart!(r)
    for side in (Nord,Ost,Sud,West)
        putmarkers!(r,side)
    end
    putmarker!(r)
    
    fdsquare!(r)


end

function secondperimetr!(r::Robot)
    gtlowstart!(r)
    putmarker!(r)
    move!(r,Nord)
    while isborder(r,Ost)==true
        putmarker!(r)
        move!(r,Nord)
    end
    putmarker!(r)
    move!(r,Ost)
    while isborder(r,Sud)==true
        putmarker!(r)
        move!(r,Ost)
    end
    putmarker!(r)
    move!(r,Sud)
    while isborder(r,West)==true
        putmarker!(r)
        move!(r,Sud)
    end
    putmarker!(r)
    move!(r,West)
    while isborder(r,Nord)==true
        putmarker!(r)
        move!(r,West)
    end

end

gotostart!(r::Robot) =
    while isborder(r,Sud)==false
        move!(r,Sud)
    end
    while isborder(r,West)==false
        move!(r,West)
    end

putmarkers!(r::Robot,side::HorizonSide) = 
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end

fdsquare!(r::Robot) = 
    while isborder(r,Nord)==false && isborder(r,Ost)==false
        move!(r,Ost)
        move!(r,Nord)
    end
    putmarker!(r)
    

gtlowstart!(r::Robot) = 
    while isborder(r,Nord)==true
        move!(r,West)
    end



firstperimetr!(r)
secondperimetr!(r)