
Nx = 128;           % number of grid points in the x (row) direction
Nz = 256;           % number of grid points in the z (column) direction
dx = 1e-3;          % grid point spacing in the x direction [m]
dz = 1e-3;          % grid point spacing in the z direction [m]
kgrid = kWaveGrid(Nx, dx, Nz, dz);

medium.sound_speed = 1540; % speed of sound in water [m/s]


source.p0 = zeros(Nx, Nz);
source.p0(40, 128) = 1;     % point source 1
source.p0(64, 128) = 1;     % point source 2
source.p0(88, 128) = 1;     % point source 3

sensor.mask = zeros(Nx, Nz);
sensor.mask(:, 250) = 1;   % placing sensors/electrodes at column 250


sensor_data = kspaceFirstOrder2D(kgrid, medium, source, sensor);


save('sensor_data.mat', 'sensor_data');