using HorizonSideRobots

robot=Robot(animate=true,"10.sit")
n=readline()
n=parse(Int64,n)

function drawchesssquare!(robot, n)
    stagg_ord = 0
    side = Ost
    for _i in 1:n
        for _j in 1:n-1
            if(stagg_ord % 2 == 0)
                putmarker!(robot)
            end
            move!(robot, side)
            stagg_ord += 1
        end
        if(stagg_ord % 2 == 0)
            putmarker!(robot)
        end
        move!(robot, Nord)
        stagg_ord += 1
        side = inverse(side)
    end

    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

drawchesssquare!(robot,n)