using HorizonSideRobots

r=Robot(animate=true,"7.sit")

function exit!(r::Robot)
    str!(r)
    fndex!(r)
end

str!(r::Robot) = 
    while isborder(r,West)==false
        move!(r,West)
    end

fndex!(r::Robot) = 
    while isborder(r,Nord)==true
        move!(r,Ost)
    end

exit!(r)