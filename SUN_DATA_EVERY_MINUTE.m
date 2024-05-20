summer  = 300; % Day out of 365 that has been taken to represent Summer
winter =160; % Day out of 365 that has been taken to represent Winter
day= summer; 


declination_angle=23.45*sin(360*(284+day)/365*pi/180); %see equ(1) 

d=declination_angle*pi/180; 

h_mor_time = 6; % Time (sunrise) when the solar tracker is activated
h_even_time = 17; % Time (sunset) when the solar tracker stops tracking the sun

for i = h_mor_time:1:h_even_time % Loop that ensures that the sun's angle is tracked every minute
    for j = 0:1:59
        h = ((i+j/60)-12)*15*pi/180; % Hour angle calculation by eqn 17 in radians
        B=0*pi/180; % Elevation of the the Sandton area in rad
        L=26*pi/180; % Latitude of the Sandton area
        Z=10*pi/180; % 
        Daily_optimum_tilt_angle=(L-d)*180/pi; % Calculation of the daily optimum tilt angle
        Altitude_angle= asin(sin(L)*sin(d)+cos(L)*cos(d)*cos(h))*180/pi; % Calculation of the altitude angle
        a=Altitude_angle*pi/180;
        Solar_zenith_angle=90-Altitude_angle; % Calculation of the zenith angle
        phi=Solar_zenith_angle*pi/180;
        Solar_azimuth_angle= asin(cos(d)*sin(h)/cos(a))*180/pi; % Calculation of the Solar azimuth angle
        if i < 12
        z=Solar_azimuth_angle*pi/180; 
        Incidence_angle= -acos(sin(L)*sin(d)*cos(B)-cos(L)*sin(d)*sin(B)*cos(Z)+cos(L)*cos(d)*cos(h)*cos(B)+sin(L)*cos(d)*cos(h)*sin(B)*cos(Z)+cos(d)*sin(h)*sin(B)*sin(Z));%*180/pi;
        theta(i-5,j+1) = Incidence_angle; % Calculation of the angle of incidence
        else
        Incidence_angle= acos(sin(L)*sin(d)*cos(B)-cos(L)*sin(d)*sin(B)*cos(Z)+cos(L)*cos(d)*cos(h)*cos(B)+sin(L)*cos(d)*cos(h)*sin(B)*cos(Z)+cos(d)*sin(h)*sin(B)*sin(Z));%*180/pi;
        theta(i-5,j+1) = Incidence_angle; % Calculation of the angle of incidence
        end
        time(i-5,j+1) = [i+(j/60)];
    end
 final_mat = [];
 final_time = [];
 Suns_path = [];
    for w = 1:1:12
        for q = 1:1:60
             ff = theta(w,q);
             tf = time(w,q);
         final_mat = [final_mat;ff];
         final_time = [final_time;tf];
         Suns_path = [final_time final_mat]; % Matrix that stores the sun's angular position with time
         
        end
     end
end