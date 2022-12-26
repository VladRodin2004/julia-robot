using  HorizonSideRobots

r=Robot(animate=true,"8.sit")

function f_marker!(r::Robot)
    num_step=1
    side=Nord
    while !ismarker(r)
        for _i in 1:2   
            marker_find!(r, side, num_step)
            side=next(side)
        end
        num_step=num_step+1
    end
end

function marker_find!(r::Robot, side::HorizonSide, num_step::Int)  
    for _i in 1:num_step   
        if !ismarker(r)
            move!(r,side)
        else
            break
        end 
    end
end
next(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)

f_marker!(r)

