using HorizonSideRobots

r=Robot(animate=true,"1-4.sit")

function straight_cross!(r::Robot)
    for side in (Nord,West,Sud,Ost)
        putmarkers!(r,side)
        move_markers(r,inverse(side))
    end
    putmarker!(r)
end

putmarkers!(r::Robot,side::HorizonSide) = 
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end

move_markers(r::Robot,side::HorizonSide) = 
    while ismarker(r)==true
        move!(r,side)
    end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))

straight_cross!(r)