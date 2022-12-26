using HorizonSideRobots

r=Robot(animate=true,"1-4.sit")

function dicross!(r::Robot)
    gotostart!(r)
    
    putmarker!(r)

    diagonal1!(r)

    gotosud!(r)
    putmarker!(r)
    
    diagonal2!(r)

    putmarker!(r)
end

gotostart!(r::Robot) =
    while isborder(r,Sud)==false
        move!(r,Sud)
    end
    while isborder(r,West)==false
        move!(r,West)
    end

diagonal1!(r::Robot) =
    while isborder(r,Ost)==false && isborder(r,Nord)==false
        move!(r,Ost)
        move!(r,Nord)
        putmarker!(r)
    end

gotosud!(r::Robot) = 
    while isborder(r,Sud)==false
        move!(r,Sud)
    end

diagonal2!(r::Robot) =
    while isborder(r,West)==false && isborder(r,Nord)==false
        move!(r,West)
        move!(r,Nord)
        putmarker!(r)
    end


dicross!(r)
