extends Sprite2D
var Head5; var Base1; var Base2
var Bar1; var Bar2; var Bar3; var Bar4
var Pin1; var Pin2; var Pin3; var Pin4; var Pin5; var Pin6; var Pin7
var L1; var L2; var L3; var L4; var L5;
var theta0; var time; var Omega;

# Called when the node enters the scene tree for the first time.
func _ready():
	Head5 = get_node("Head5");
	Base1 = get_node("Base1"); Base2 = get_node("Base2")
	Bar1 = get_node("Bar1"); Bar2 = get_node("Bar2"); 
	Bar3 = get_node("Bar3"); Bar4 = get_node("Bar4"); 
	theta0 = Bar1.rotation
	
	Pin1 = get_node("Pin1"); Pin2 = get_node("Pin2"); Pin3 = get_node("Pin3")
	Pin4 = get_node("Pin4"); Pin5 = get_node("Pin5"); Pin6 = get_node("Pin6")
	Pin7 = get_node("Pin7")
	
	L1 = _dist(Pin1, Pin4); L2 = _dist(Pin3, Pin2); L3 = _dist(Pin4, Pin3)
	L4 = _dist(Pin6, Pin5);	L5 = _dist(Pin7, Pin6)
	
	time = 0; Omega = 2*PI;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if(time>1): time -= 1
	Bar1.rotation = theta0 + Omega*time
	Pin4.position = L1*Vector2(cos(Bar1.rotation), sin(Bar1.rotation))
	Bar3.position = Pin4.position
	Pin3.position = pinposN(Pin4, Pin2, L3, L2, Pin3)
	Bar3.rotation = _angle(Pin4, Pin3)
	Bar2.rotation = _angle(Pin2, Pin3)
	Pin5.position = _lerp(Pin4, Pin3, 0.7)
	Bar4.position = Pin5.position
	Pin6.position = pinposN(Pin5, Pin7, L4, L5, Pin6)
	Bar4.rotation = _angle(Pin5, Pin6)
	Head5.rotation = _angle(Pin7, Pin6)
	pass

func pinposA(p1, p2, L1, L2, p3):
	var v1 = p1.position; var v2 = p2.position; var v3 = p3.position
	var x1 = v1.x; var y1 = v1.y; var x2 = v2.x; var y2 = v2.y; 
	var v_1 =  Vector2(-(L1**2 - L2**2 - x1**2 + x2**2 - y1**2 + y2**2 + (y1*(x1*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - x2*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - L1**2*y1 + L1**2*y2 + L2**2*y1 - L2**2*y2 + x1**2*y1 + x1**2*y2 + x2**2*y1 + x2**2*y2 - y1*y2**2 - y1**2*y2 + y1**3 + y2**3 - 2*x1*x2*y1 - 2*x1*x2*y2))/(x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2) - (y2*(x1*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - x2*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - L1**2*y1 + L1**2*y2 + L2**2*y1 - L2**2*y2 + x1**2*y1 + x1**2*y2 + x2**2*y1 + x2**2*y2 - y1*y2**2 - y1**2*y2 + y1**3 + y2**3 - 2*x1*x2*y1 - 2*x1*x2*y2))/(x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))/(2*x1 - 2*x2),
				(x1*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - x2*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - L1**2*y1 + L1**2*y2 + L2**2*y1 - L2**2*y2 + x1**2*y1 + x1**2*y2 + x2**2*y1 + x2**2*y2 - y1*y2**2 - y1**2*y2 + y1**3 + y2**3 - 2*x1*x2*y1 - 2*x1*x2*y2)/(2*(x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2)))
	var v_2 =  Vector2(-(L1**2 - L2**2 - x1**2 + x2**2 - y1**2 + y2**2 + (y1*(x2*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - x1*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - L1**2*y1 + L1**2*y2 + L2**2*y1 - L2**2*y2 + x1**2*y1 + x1**2*y2 + x2**2*y1 + x2**2*y2 - y1*y2**2 - y1**2*y2 + y1**3 + y2**3 - 2*x1*x2*y1 - 2*x1*x2*y2))/(x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2) - (y2*(x2*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - x1*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - L1**2*y1 + L1**2*y2 + L2**2*y1 - L2**2*y2 + x1**2*y1 + x1**2*y2 + x2**2*y1 + x2**2*y2 - y1*y2**2 - y1**2*y2 + y1**3 + y2**3 - 2*x1*x2*y1 - 2*x1*x2*y2))/(x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))/(2*x1 - 2*x2),
				(x2*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - x1*((L1**2 + 2*L1*L2 + L2**2 - x1**2 + 2*x1*x2 - x2**2 - y1**2 + 2*y1*y2 - y2**2)*(- L1**2 + 2*L1*L2 - L2**2 + x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2))**(0.5) - L1**2*y1 + L1**2*y2 + L2**2*y1 - L2**2*y2 + x1**2*y1 + x1**2*y2 + x2**2*y1 + x2**2*y2 - y1*y2**2 - y1**2*y2 + y1**3 + y2**3 - 2*x1*x2*y1 - 2*x1*x2*y2)/(2*(x1**2 - 2*x1*x2 + x2**2 + y1**2 - 2*y1*y2 + y2**2)))
	if((v3-v_1).length() > (v3-v_2).length()):
		return v_2
	else:
		return v_1

func pinposN(p1, p2, L1, L2, p3):
	var v1 = p1.position; var v2 = p2.position; var v3 = p3.position
	var x1 = v1.x; var y1 = v1.y; var x2 = v2.x; var y2 = v2.y; 
	var x = v3.x; var y = v3.y; # Initial guess
	var v = Vector2((x-x1)**2 + (y-y1)**2 - L1**2, (x-x2)**2 + (y-y2)**2 - L2**2); # Residual
	var iter = 0;
	while(v.length() > 1e-6 && iter < 10): # Check of norm of Residual is less than tolerance
		var J1 = Vector2((y-y2)*2, -(y-y1)*2); # Adjoint of Jacobian Row 1
		var J2 = Vector2(-(x-x2)*2, (x-x1)*2); # Adjoint of Jacobian Row 2
		var D = J1.x*J2.y - J1.y*J2.x;         # Determinant ofJacobian
		x -= J1.dot(v)/D;                      # Update x
		y -= J2.dot(v)/D;                      # Update y
		v = Vector2((x-x1)**2 + (y-y1)**2 - L1**2, (x-x2)**2 + (y-y2)**2 - L2**2); # Update Residual
		iter += 1;
	v3 = Vector2(x, y)
	return v3;

func _angle(Obj1, Obj2):
	var v = Obj2.position - Obj1.position
	return atan2(v.y, v.x)

func _dist(Obj1, Obj2):
	return (Obj1.position - Obj2.position).length()

func _lerp(Obj1, Obj2, w):
	return Obj1.position.lerp(Obj2.position, w)
