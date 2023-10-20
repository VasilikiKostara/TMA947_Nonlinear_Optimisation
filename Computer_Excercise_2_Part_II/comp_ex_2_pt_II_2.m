
function fmincon_2
    LB = [-inf; -inf];  
    UB = [inf; inf]; 
    A = [];  
    b = [];
    Aeq = [];
    beq = [];
    x0 = [4.5; -1];  % starting point

    options = optimset('LargeScale', 'off', ...
        'Display', 'iter', ...
        'GradObj', 'on', ...
        'GradCon', 'on', ...
        'DerivativeCheck', 'on');
    
    [x, z, ef, output, lambda] = fmincon(@f, x0, ...
        A, b, ...
        Aeq, beq, ...
        LB, UB, ...
        @g, options);

    if (ef > 0)
        disp('============================================================');
        disp('Optimal solution:');
        disp(x');
        disp(['Optimal value: ', num2str(z)]);
        disp('Lagrange multipliers:');
         disp( sprintf( 'Upper bounds    :' ) ); disp( lambda.lower' );
         disp( sprintf( 'Lower bounds    :' ) ); disp( lambda.upper' );
         disp( sprintf( 'Lin. ineq.      :' ) ); disp( lambda.ineqlin' );
         disp( sprintf( 'Lin. eq.        :' ) ); disp( lambda.eqlin' );
         disp( sprintf( 'Nonlin. ineq.   :' ) ); disp( lambda.ineqnonlin' );
         disp( sprintf( 'Nonlin. eq.     :' ) ); disp( lambda.eqnonlin' );      
    end;
    return;


function [f, df] = f(x)
    f = x(1);
    df = [1; 0];
    return;
    

function [C, Ceq, dC, dCeq] = g(x)
    C = [(x(1) - 1)^2 + (x(2) + 2)^2 - 16; -x(1)^2 - x(2)^2 + 13];
    dC = [2*(x(1)-1), 2*(x(2)+2); -2*x(1), -2*x(2)]';
    Ceq = [];
    dCeq = [];
    return;
