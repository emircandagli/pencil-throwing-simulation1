%Emir Can Dağlı 2517704 HW3_ID2517704_Q3
%assuming that bottom left side of the table is origin
%define random x, y coordinates and angle
x = rand * 10;
y = rand * 10;
angle = 2 * pi * rand();

%define the coordination of other sides of the rod
x_2 = x + (0.8 * cos(angle));
y_2 = y + (0.8 * sin(angle));

%define the center of mass
cm_x = x + (0.4 * cos(angle));
cm_y = y + (0.4 * sin(angle));

%define the line which closest to coordinates
d = round(cm_y);

%initially, check the pen is fall down off the table
%assume that the center of mass is outside the table, pen falls down
if cm_x < 0 || cm_y < 0 || cm_x > 10 || cm_y > 10
    %A virtual line is drawn that divides the remaining parts of 
    %the pen on the table into two. 
    if (cm_x < 0 && cm_y < 0) ||  (cm_x > 10 && cm_y < 0) %checking the bottom side of the corners
        line_y = (((x - round(cm_x))*tan(angle)) + d);
        %line_y is the equation of a line drawn from the farthest point it can fall.
        %If the given coordinate is below the line, there is an intersection.
        if y < line_y
           disp("Pen falls down with touching line")
        else
           disp("Pen falls down without touching line")
        end
    elseif (cm_x < 0 && cm_y > 10) || (cm_x > 10 && cm_y > 10) %checking the upper side of the corners
        line_y = (((x - round(cm_x))*tan(angle)) + d);
        %If the given coordinate is above the line, there is an intersection.
        if y > line_y
            disp("Pen falls down with touching line")
        else
            disp("Pen falls down without touching line")
        end
    elseif cm_y < 0 || cm_y > 10
        disp("Pen falls down with touching line")
        %if there is a only center of masses acording to y are outside of
        %the table, there is a exactly intersection occurs
    elseif (y > d)  
        %If the given coordinate is below the line, there is an intersection.
        line_y = (((x - round(cm_x))*tan(angle)) + d);
        if y > line_y
            disp("Pen falls down without touching line")
        else
            disp("Pen falls down with touching line")
        end
    elseif (y < d)
        line_y = (((x - round(cm_x))*tan(angle)) + d);
        %If the given coordinate is above the line, there is an intersection.
        if y > line_y
           disp("Pen falls down with touching line")
        else
           disp("Pen falls down without touching line")
        end
    end
    
else
    %difference of y coordinates between other intersection line determines
    %the intersection or not
    if (x_2 < 0) || (x_2 > 10) %checking whether the other end of the pencil on in the table or not 
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
end

x_coordinate_tip = [x x_2];
y_coordinate_tip = [y y_2];
plot(x_coordinate_tip,y_coordinate_tip)
xlim([0 10])
ylim([0 10])
ax = gca;
ax.YGrid = 'on';
ax.GridLineStyle = '-';
