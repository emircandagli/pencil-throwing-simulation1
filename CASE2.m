%Emir Can Dağlı 2517704 HW3_ID2517704_Q4
%assume that bottom left corner of the table is origin
%define random x, y coordinates and angle
x = rand * 10;
y = rand * 10;
angle = 2 * pi * rand();

%initially, check the pen is fall down off the table
%define the center of mass
cm_x = x + (0.4 * cos(angle));
cm_y = y + (0.4 * sin(angle));
%define the coordination of other sides of the rod
x_2 = x + (0.8 * cos(angle));
y_2 = y + (0.8 * sin(angle));

%define the line which closest to coordinates
d = round(cm_y);

if cm_x < 0 || cm_y < 0 || cm_x > 10 || cm_y > 10
    disp("Pen falls down.")
else
    if x < 5 && x_2 < 5 %check the pen was dropped in left side on the table
        if rem(d,2) == 1 %check the closest line is solid line or not
            if (x_2 < 0) %checking whether the other end of the pencil on in the table or not 
            %determine the last point where the pen touches the table
                l_y = (((round(cm_x) - x)*tan(angle)) + y);

                if (y - d) < 0 && (l_y - d) > 0
                    disp("Intersection")
                elseif (y - d) > 0 && (l_y - d) < 0
                    disp("Intersection")
                else 
                    disp("No intersection")
                end
            else
                if (y - d) < 0 && (y_2 - d) > 0
                    disp("Intersection")
                elseif (y - d) > 0 && (y_2 - d) < 0
                    disp("Intersection")
                else 
                    disp("No intersection")
                end
            end
        elseif rem(d,2) == 0
            disp("No intersection")
        end
    elseif x > 5 && x_2 > 5 %check the pen was dropped in right side on the table
        if rem(d,2) == 0 %check the closest line is solid line or not
            if (x_2 > 10) %checking whether the other end of the pencil on in the table or not 
            %determine the last point where the pen touches the table
                l_y = (((round(cm_x) - x)*tan(angle)) + y);

                if (y - d) < 0 && (l_y - d) > 0
                    disp("Intersection")
                elseif (y - d) > 0 && (l_y - d) < 0
                    disp("Intersection")
                else 
                    disp("No intersection")
                end
            else
                if (y - d) < 0 && (y_2 - d) > 0
                    disp("Intersection")
                elseif (y - d) > 0 && (y_2 - d) < 0
                    disp("Intersection")
                else 
                    disp("No intersection")
                end
            end
        elseif rem(d,2) == 1
            disp("No intersection")
        end
    else 
        %If the pen is between two sides, we divide the pen into 
        %two different parts and solve the parts according to their
        %regions that left side or right side
        y_3 = (((5 - x)*tan(angle)) + y);
        if x > 5 
            right_side = y;
            left_side = y_2;
        elseif x < 5
            right_side = y_2;
            left_side = y;
        end
        %if the closest line is odd, check the left side of the table
        %otherwise, check the right side
        if rem(d,2) == 1
            if (left_side - d) < 0 && (y_3 - d) > 0
                disp("Intersection")
            elseif (left_side - d) > 0 && (y_3 - d) < 0
                disp("Intersection")
            else 
                disp("No intersection") % if center of mass close the right side ot the line there is no possible the other side can be intersect
            end
        elseif rem(d,2) == 0
            if (right_side - d) < 0 && (y_3 - d) > 0
                disp("Intersection")
            elseif (right_side - d) > 0 && (y_3 - d) < 0
                disp("Intersection")
            else 
                disp("No intersection")
            end
            
        end
    end
end
        
x_coordinate_tip = [x x_2];
y_coordinate_tip = [y y_2];
plot(x_coordinate_tip,y_coordinate_tip)
xlim([0 10])
ylim([0 10])
ax = gca;
ax.YGrid = 'on';
ax.GridLineStyle = '-';