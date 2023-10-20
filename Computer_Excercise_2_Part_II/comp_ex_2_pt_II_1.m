
function fmincon_1
  LB = [-inf; -inf]; 
  UB = [inf; inf];
  A = [-2,1]; b = [0];   % linear ineq. constr.
  Aeq = []; beq = [];
  x0 = [0; 0];

  options = optimset( 'LargeScale', 'off', ...
                      'Display', 'iter', ...
	              'GradObj', 'on', ...
                      'GradCon', 'on', ...
                      'DerivativeCheck', 'on' );

  [x,z,ef,output,lambda] = fmincon( @f, x0, ...
                                    A, b, ...
                                    Aeq, beq, ...
                                    LB, UB, ...
                                    @g, options );
  if( ef > 0 )
    disp( sprintf( '============================================================' ) );
    disp( sprintf( 'Optimal solution: ') ); disp( x' );
    disp( sprintf( 'Optimal value:    %g', z ) );
    disp( 'Lagrange multipliers: ' );
    disp( sprintf( 'Upper bounds    :' ) ); disp( lambda.lower' );
    disp( sprintf( 'Lower bounds    :' ) ); disp( lambda.upper' );
    disp( sprintf( 'Lin. ineq.      :' ) ); disp( lambda.ineqlin' );
    disp( sprintf( 'Lin. eq.        :' ) ); disp( lambda.eqlin' );
    disp( sprintf( 'Nonlin. ineq.   :' ) ); disp( lambda.ineqnonlin' );
    disp( sprintf( 'Nonlin. eq.     :' ) ); disp( lambda.eqnonlin' );
  end;
  return;


function [f, df] = f(x)
  f  = 2*x(1)^2 - x(1) + x(2)^2 - 2*x(2) - x(1)*x(2) ;
  df = [4*x(1) - x(2) - 1; 2*x(2) - x(1) - 2];
  return;

  
function [C, Ceq, dC, dCeq] = g(x)
   C    = [x(1)^2 - x(2)]; 
   Ceq  = [];
   dC   = [2*x(1); -1];
   dCeq = [];
   return;
