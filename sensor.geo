#
## Ferromagnetic core and two coils
#
algebraic3d

## Ferromagnetic core; Cylinder with length 10 cm and radius - 1 cm;

solid Core = cylinder(0, 0, -0.06; 0, 0, 0.06; 0.01)
            and plane(0, 0, 0.05; 0, 0, 1)
            and plane(0, 0, -0.05; 0, 0, -1)
            -maxh=0.002;

## Sensing Coil; Hollow cyilnder with length 1 cm and wall thickness - 2 mm

solid SensCoilIn = cylinder(0, 0, -0.006; 0, 0, 0.006; 0.012)
                  and plane(0, 0, 0.005; 0, 0, 1)
                  and plane(0, 0, -0.005; 0, 0, -1);

solid SensCoilOut = cylinder(0, 0, -0.006; 0, 0, 0.006; 0.014)
                  and plane(0, 0, 0.005; 0, 0, 1)
                  and plane(0, 0, -0.005; 0, 0, -1);

solid SensCoil = SensCoilOut and not SensCoilIn -maxh=0.002;

## Magnetizing Coil; Hollow cyilnder with length 10 cm and wall thickness - 2 mm

solid MagCoilIn = cylinder(0, 0, -0.06; 0, 0, 0.06; 0.016)
                  and plane(0, 0, 0.05; 0, 0, 1)
                  and plane(0, 0, -0.05; 0, 0, -1);

solid MagCoilOut = cylinder(0, 0, -0.06; 0, 0, 0.06; 0.018)
                  and plane(0, 0, 0.05; 0, 0, 1)
                  and plane(0, 0, -0.05; 0, 0, -1);

solid MagCoil = MagCoilOut and not MagCoilIn -maxh=0.002;

## Air

solid Air = sphere(0, 0, 0; 0.5)
            and not MagCoil
            and not SensCoil
            and not Core
            -maxh=0.3;

tlo Core -col=[0, 0, 1];
tlo SensCoil -col=[1, 0, 0];
tlo MagCoil -col=[0, 1, 0];
tlo Air -col=[0, 0.5, 0.5] -transparent;
