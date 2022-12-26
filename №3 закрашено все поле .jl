using HorizonSideRobots

r=Robot(animate=true,"1-4.sit")

function marker_full!(r::Robot)
    gotostart!(r)
    putmarker!(r)
    while isborder(r,Ost)==false
        for side in (Nord,Sud)
            putmarkers!(r,side)
        end
        move!(r,Ost)
    end
    putmarker!(r)
    putmarkers!(r,Nord)
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

marker_full!(r)