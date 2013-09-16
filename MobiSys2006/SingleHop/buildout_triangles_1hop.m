%BUILDOUT_TRIANGLES_1HOP.M

function [xvec,yvec] = buildout_triangles_1hop(centerx,centery,rad)

xvec(1) = centerx + (rad/2);
xvec(2) = centerx + rad;
xvec(3) = centerx + (rad/2);
xvec(4) = centerx - (rad/2);
xvec(5) = centerx - rad;
xvec(6) = centerx - (rad/2);

yvec(1) = centery + (sqrt(3)*rad/2);
yvec(2) = centery;
yvec(3) = centery - (sqrt(3)*rad/2);
yvec(4) = centery - (sqrt(3)*rad/2);
yvec(5) = centery;
yvec(6) = centery + (sqrt(3)*rad/2);