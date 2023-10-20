n = 11      # Number of nodes
n_G = 9     # Number of generators
n_C = 7     # Number of consumers

# Location nodes
G_nodes = [2, 2, 2, 3, 4, 5, 7, 9, 9]
C_nodes = [1, 4, 6, 8, 9, 10, 11]

# Conductance [p/v^2]
conductance_vals = [-20.1, -22.3, -16.8, -17.2, -11.7, -19.4, -10.8, -12.3, -9.2, -13.9, -8.7, -11.3, -14.7, -13.5, -26.7]

# Susceptance [p/v^2]
susceptance_vals = [4.12, 5.67, 2.41, 2.78, 1.98, 3.23, 1.59, 1.71, 1.26, 1.11, 1.32, 2.01, 2.41, 2.14, 5.06]

node_edges = [(1, 2), (1, 11), (2, 3), (2, 11), (3, 4), (3, 9), (4, 5), (5, 6), (5, 8), (6, 7), (7, 8), (7, 9), (8, 9), (9, 10), (10, 11)]

# Coeffecients between nodes
b = zeros(Float64, n, n) 
g = zeros(Float64, n, n)
for index in eachindex(node_edges)
    i, j = node_edges[index]
    b[i, j] = b[j, i] = conductance_vals[index]
    g[i, j] = g[j, i] = susceptance_vals[index]
end

# Adjacency matrix for generators
E_G = zeros(Int64, n, n_G)
for j in 1:n_G
    E_G[G_nodes[j], j] = 1
end

# Adjacency matrix for consumers
E_C = zeros(Int64, n, n_C)
for j in 1:n_C
    E_C[C_nodes[j], j] = 1
end

# Maximum capacity [pu]
M = [0.02, 0.15, 0.08, 0.07, 0.04, 0.17, 0.17, 0.26, 0.05]

# Energy production cost [sek/pu]
c = [175, 100, 150, 150, 300, 350, 400, 300, 200]

# Demand active power [pu]
D = [0.10, 0.19, 0.11, 0.09, 0.21, 0.05, 0.04]

# Phase range
theta_max = pi
theta_min = -pi

# Voltage range [vu]
v_max = 1.02
v_min = 0.98

# Limit of reactive power as a fraction of maximum capacity  
L = 1.003