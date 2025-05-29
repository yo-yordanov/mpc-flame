import numpy as np

# Load data
y = np.loadtxt('../../safefl/data/HAR/train/y_train.txt', dtype=int)

modulus = 2**32

# Generate random shares for players
shares0 = np.random.randint(0, modulus, size=y.shape, dtype='uint32')
shares1 = (y - shares0) % modulus

# Correctness check
reconstructed = (shares0 + shares1) % modulus
assert np.all(reconstructed == y)

# Save one integer per line
np.savetxt('../Player-Data/Input-P0-0', shares0, fmt='%d')
np.savetxt('../Player-Data/Input-P1-0', shares1, fmt='%d')