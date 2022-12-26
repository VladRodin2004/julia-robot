using HorizonSideRobots

r=Robot(animate=true,"1-4.sit")

function perimetr!(r::Robot)
    gotostart!(r)
    for side in (Nord,Ost,Sud,West)
        putmarkers!(r,side)
    end
    putmarker!(r)
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

perimetr!(r)
