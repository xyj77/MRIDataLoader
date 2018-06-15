function S = mark(num, Z, S)
    switch Z
        case 'A'
            S{num, 2} = 1;
        case 'B'
            S{num, 3} = 1;
        case 'C'
            S{num, 4} = 1;
        case 'D'
            S{num, 5} = 1;
        case 'E'
            S{num, 6} = 1;
        case 'F'
            S{num, 7} = 1;
        case 'G'
            S{num, 8} = 1;
        case 'H'
            S{num, 9} = 1;
        case 'I'
            S{num, 10} = 1;
        otherwise
            S{num, 11} = 1;
    end
end