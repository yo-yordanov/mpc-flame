# 🧪 FLAME Protocol with MP-SPDZ & SafeFL

This project simulates the **FLAME protocol using secure Multi-Party Computation (MPC)**. It includes:

- Splitting dataset values into two additive shares.
- Reconstructing the original values through **two-party computation** using the [MP-SPDZ](https://github.com/data61/MP-SPDZ) framework.

Currently, only the [y_train](./safefl/data/HAR/train/y_train.txt) portion of the dataset is used to test reconstruction via MP-SPDZ because it is more compact.

The FLAME protocol can then be executed in **plaintext** using the [SafeFL](https://github.com/thiagofreitasalves/safefl) repository, enabling exploration of hybrid approaches that could integrate **Trusted Execution Environments (TEEs)** in future extensions.

---

## 📥 1. Download the Dataset

Download the [UCI HAR Dataset](https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip) and extract it to [safefl/data/HAR/](safefl/data/)

---

## 🧩 2. Generate MPC-Compatible Shares
Use the script below to split the dataset into two additive shares (modulo 2^32), one for each party:

```bash
python flame-protocol/Source/data_generator.py
```

This will generate two input files containing secret shares to be used by MP-SPDZ.

---

## 🔐 3. Run the MPC Protocol (Using MP-SPDZ)
To reconstruct and reveal the secret-shared values using the FLAME protocol inside MP-SPDZ, run

```bash
cd flame-protocol
./run.sh flame.mpc
```

This executes the [flame.mpc](./flame-protocol/Source/flame.mpc) script and prints the reconstructed values from the two shares.

---

## 🧪 4. Run FLAME in Plaintext via SafeFL
SafeFL requires the dependencies from [safefl/requirements.txt](./safefl/requirements.txt):
```bash
pip install -r safefl/requirements.txt
```

To test the FLAME aggregation protocol in plaintext without MPC, use the SafeFL repo:

```bash
python main.py --aggregation flame --byz_type scaling_attack
```

Note: This setup has shown suspiciously high backdoor success rates

---
