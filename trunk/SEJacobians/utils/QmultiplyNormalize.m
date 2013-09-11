clear
syms w1 x1 y1 z1 w2 x2 y2 z2 real
q1=[w1; x1; y1; z1]
 
q1 =
 
 x1
 y1
 z1
 w1
 
q2=[w2; x2; y2; z2]
 
q2 =
 
 x2
 y2
 z2
 w2
  

 qdd = [q1(1) * q2(1) - q1(2) * q2(2) - q1(3) * q2(3) - q1(4) * q2(4);
     q1(1) * q2(2) + q1(2) * q2(1) + q1(3) * q2(4) - q1(4) * q2(3);
     q1(1) * q2(3) + q1(3) * q2(1) + q1(4) * q2(2) - q1(2) * q2(4);
     q1(1) * q2(4) + q1(4) * q2(1) + q1(2) * q2(3) - q1(3) * q2(2)];
 
qd = qdd ./ sqrt(qdd' * qdd)
 
qd =
 
  (w1*x2 + w2*x1 + y1*z2 - y2*z1)/((w1*x2 + w2*x1 + y1*z2 - y2*z1)^2 + (w1*y2 + w2*y1 - x1*z2 + x2*z1)^2 + (w1*z2 + w2*z1 + x1*y2 - x2*y1)^2 + (x1*x2 - w1*w2 + y1*y2 + z1*z2)^2)^(1/2)
  (w1*y2 + w2*y1 - x1*z2 + x2*z1)/((w1*x2 + w2*x1 + y1*z2 - y2*z1)^2 + (w1*y2 + w2*y1 - x1*z2 + x2*z1)^2 + (w1*z2 + w2*z1 + x1*y2 - x2*y1)^2 + (x1*x2 - w1*w2 + y1*y2 + z1*z2)^2)^(1/2)
  (w1*z2 + w2*z1 + x1*y2 - x2*y1)/((w1*x2 + w2*x1 + y1*z2 - y2*z1)^2 + (w1*y2 + w2*y1 - x1*z2 + x2*z1)^2 + (w1*z2 + w2*z1 + x1*y2 - x2*y1)^2 + (x1*x2 - w1*w2 + y1*y2 + z1*z2)^2)^(1/2)
 -(x1*x2 - w1*w2 + y1*y2 + z1*z2)/((w1*x2 + w2*x1 + y1*z2 - y2*z1)^2 + (w1*y2 + w2*y1 - x1*z2 + x2*z1)^2 + (w1*z2 + w2*z1 + x1*y2 - x2*y1)^2 + (x1*x2 - w1*w2 + y1*y2 + z1*z2)^2)^(1/2)
 

qdE = quatnormalize(quatmultiply(q1, q2))
 
qdE =
 
 -(w1*w2 - x1*x2 + y1*y2 + z1*z2)/((w1^2 + x1^2 + y1^2 + z1^2)*(w2^2 + x2^2 + y2^2 + z2^2))^(1/2)
  (w2*z1 - w1*z2 + x1*y2 + x2*y1)/((w1^2 + x1^2 + y1^2 + z1^2)*(w2^2 + x2^2 + y2^2 + z2^2))^(1/2)
  (w1*y2 - w2*y1 + x1*z2 + x2*z1)/((w1^2 + x1^2 + y1^2 + z1^2)*(w2^2 + x2^2 + y2^2 + z2^2))^(1/2)
  (w1*x2 + w2*x1 + y1*z2 - y2*z1)/((w1^2 + x1^2 + y1^2 + z1^2)*(w2^2 + x2^2 + y2^2 + z2^2))^(1/2)