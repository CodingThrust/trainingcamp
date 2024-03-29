# Final Report

## Introduction
Rydbeg atoms are not the atoms corresponding to a particular element, but rather a class of excited state atoms with many electrons in the outer layers of the atoms. The Rydberg atoms are characterized by the fact that the outermost electron is in a state with a very high principal quantum number.

We can excited an atom to a high energy level, when the energy level is high enough, the principal quantum number is large enough, this atom will be excited to a Rydberg state, which is called Rydberg atom.

The Rydberg atoms have a number of interesting properties, such as a very large atomic radius and a very long lifetime. The Rydberg atoms are also very sensitive to external electric and magnetic fields, and are therefore used in a number of applications, such as quantum computing and quantum optics.

When n>>1, Rydberg atoms will have dipole-dipole interactions proportional to $n^4$, and radiative lifetimes proportional to $n^3$. The dipole-dipole interactions will influence the energy levels of atoms, make a move them. The ground state atoms round Rydberg atoms will lift their energy level, so that a laser beam that could have excited this ground state atom to the Rydberg state, now the laser can't reach the Rydber energy level. This is called the Rydberg blocking, and it is a very important property.

When we research the Rydberg atoms, we usually use the laser to excite the atoms to the Rydberg state. We always choose the heavy atoms to excite, because the heavy atoms have a large principal quantum number, the energy level of the outer layer electrons is high enough, so the heavy atoms are easier to excite to the Rydberg state. Because the single electron of the outermost layer is easier to excite, so we prefer to choose the alkali metal atom. Now people often use Rb atom or Sr atom to reach the Rydberg state.

In Rydberg atoms, the size of electron cloud is proportional to $n^2$, so the size of Rydberg atoms is very large. This will influence other properties of Rydberg atoms in proportion to the power of n, such as the dipole-dipole interactions and the radiative lifetimes. For the same atom, which has a small ground state wave function when its outmost layer electrons are in the ground state. When it is excited to the Rydberg state, the wave function will be very large. So the spatial overlap between the ground state wave function and the Rydberg state wavefunction with high principal quantum number will be very small, so the coupling between the ground state and the Rydberg state will be very weak. 

The complexity of regulating quantum states in pratical experiment is mainly limited by the lifetime of the quantum state. The longer the lifetime, the more complex the degree of the quantum state. So the long lifetime of the Rydberg state can allow us to do more operations to this system, and we can implement more regulation programmes in practical experiment.

A ground atom is hard to excite to the Rydberg state by one laser photon, because the energy difference between the ground state and the Rydberg state is very large. But we can use two laser photons to excite the ground state atom to the Rydberg state, this is called the two-photon excitation. The two-photon excitation is a very important method to excite the Rydberg atoms, and it is widely used in the experiment.


## Hamiltonians

Quantum Hamiltonians encode the essential physical properties of a quantum system. For the analog mode of neutral-atom quantum computers, the quantum dynamics is governed by the Rydberg Hamiltonian $\hat{\mathcal{H}}$:

```math
i \hbar \dfrac{\partial}{\partial t} | \psi \rangle = \hat{\mathcal{H}}(t) | \psi \rangle,  \\

\frac{\mathcal{H}(t)}{\hbar} = \sum_j \frac{\Omega_j(t)}{2} \left( e^{i \phi_j(t) } | g_j \rangle  \langle r_j | + e^{-i \phi_j(t) } | r_j \rangle  \langle g_j | \right) - \sum_j \Delta_j(t) \hat{n}_j + \sum_{j < k} V_{jk} \hat{n}_j \hat{n}_k,
```

where $\Omega_j$, $\phi_j$, and $\Delta_j$  denote the Rabi frequency, laser phase, and the detuning of the driving laser field on atom (qubit) ``j`` coupling the two states  $ | g_j \rangle $ (ground state) and $ | r_j \rangle $ (Rydberg state); $\hat{n}_j = |r_j\rangle \langle r_j|$ is the number operator, and $V_{jk} = C_6/|\mathbf{x}_j - \mathbf{x}_k|^6$ describes the Rydberg interaction (van der Waals interaction) between atoms ``j`` and ``k`` where $\mathbf{x}_j$ denotes the position of the atom ``j``; $C_6$ is the Rydberg interaction constant that depends on the particular Rydberg state used. For Bloqade, the default $C_6 = 862690 \times 2\pi \text{ MHz μm}^6$ for $|r \rangle = \lvert 70S_{1/2} \rangle$ of the $^{87}$ Rb atoms; $\hbar$ is the reduced Planck's constant.

One can use the Rydberg Hamiltonian to understand the ground state properties of the corresponding system and to generate interesting quantum dynamics. 
The Rydberg Hamiltonian is generally specified by atom positions $\mathbf{x}_j$, Rabi frequencies $\Omega_j$, laser phase $\phi_j$, and detunings $\Delta_j$. In Bloqade, 
we can easily create a Hamiltonian by inputting these variable parameters into the function [`rydberg_h`](@ref). Furthermore, by inputting waveforms for the Rabi frequency and detuning, we can easily generate time-dependent Hamiltonians. 

### Building Time-Independent Hamiltonians

To specify the Hamiltonian, we first need to specify the atom positions, which determine the Rydberg interactions strengths $V_{jk}$ between pairs of atoms. Here, we generate a square lattice by using the code below:

```julia
using Bloqade
atoms = generate_sites(SquareLattice(), 3, 3, scale=6.3)
```

 

Then, the Hamiltonian can be simply built by inputting the generated atom positions `atoms` and by specifying the strength of the detuning `Δ`, Rabi frequency `Ω`, and laser phase `ϕ`:

```julia
h0 = rydberg_h(atoms; Δ=1.2*2π, Ω=1.1*2π, ϕ=2.1)
```

Note that the default value for the Rydberg interaction constant is $C_6 = 2\pi \times 862690 \text{ MHz μm}^6$ to match the default unit used on the hardware. For more information about units, please 
refer to [Bloqade](@ref). Instead of using the default value for $C_6$, the users are free to set their own values. For instance, if the users would like to have a chain lattice with nearest-neighbor atoms separated by 1 μm, and interaction strength to be a particular value, say, $2\pi * 10.0^6 \text{ MHz μm}^6$, it can be done with the following code:

```julia
atoms = generate_sites(ChainLattice(), 9, scale=1.0)
h0 = rydberg_h(atoms; C=2π*10.0^6, Δ=1.2*2π, Ω=1.1*2π, ϕ=2.1)
```

We can have some definitions about Rydberg atoms:
The quantum dynamic of Rydberg atoms can be described by the Hamiltonian:
$H=\sum_i\frac{\Omega_i}2X_i-\sum_i\Delta_in_i+\sum_{i<j}V_{ij}n_in_j$
    
where $X_i$ is the Pauli X operator, $X_{i}=\sigma_{x}^{i}=|g_{i}\rangle\langle r_{i}|+|r_{i}\rangle\langle g_i| $， $\Omega_i$ is the Rabi frequency, $\Delta_i$ is the detuning, and $n_i$ is the number operator. The last term is the Rydberg interaction term.

PXP model with the Hamiltonian:
$H=\sum_iP_{i-1}X_iP_{i+1}$

$P_i$ makes sure that only one of the two adjacent atoms can be in excited state. This constraint comes from Rydberg blockade. $P_i=|g_i\rangle\langle g_i|=(1+Z_i)/2$.

### Rydberg Blockade
The Rydberg blockade mechanism is one of the most important phenomena of neutral atom quantum computing based on Rydberg interactions. By including a term in the effective Hamiltonian which adds an interaction between adjacent atoms in the Rydberg states, one can construct gates and nontrivial dynamics that create entanglement and correlation across the system.

The Rydberg interaction is a van der Waals interaction, where there is an energy shift if two adjacent atoms are both in the Rydberg state. 

This conditional drive can be seen given the following dynamics. Suppose two atoms are close to each other (<10 μm) and so experience a strong Rydberg interaction. The left atom is either in a Rydberg state, or in the ground state, and the right atom is originally in the ground state. Then, a Rabi drive is applied to the right atom, which couples the atom's ground state to the Rydberg state. For this example, we choose a Rabi frequency of Ω=2π * 0.5 MHz and distance between atoms is 7 μm, which gives a conditional detuning (Rydberg interaction) of 2pi * 7.33 MHz. When the left atom is in the ground state (black, top), there are no interactions and the state of the right atom experiences standard Rabi oscillation between the ground state and the Rydberg state; for a particular choice of timing, this executes a π pulse, flipping the right atom from the ground to the Rydberg state. However, when the left atom is in the Rydberg state (red, bottom), there is a large detuning on the right atom due to the strong Rydberg interaction, which causes the transfer to the Rydberg state to be strongly suppressed. In this case, the right atom (up to perturbative corrections) is never in the Rydberg state. This is the so-called Rydberg blockade.

Because of the large energy shift from having two adjacent atoms in the Rydberg state, evolution from an atomic ground state with local Rabi couplings between ground and Rydberg is restricted to a low-energy subspace of states where no two adjacent atoms are in the Rydberg state. Furthermore, because the interaction strength with distance is a large power law, one can define a characteristic scale set by the Rabi frequency. If two atoms are close such that the conditional detuning is much larger than the Rabi frequency, one can consider the atoms to be blockading each other, and both atoms cannot simultaneously be in the Rydberg state. In contrast, if two atoms are far away, the two atoms never blockade each other and both atoms can simultaneously be in the Rydberg state.

![](/4.simulation/yidai//img/1site_bloqade.png)
![](/4.simulation/yidai//img/1site_itensor.png)
![](/4.simulation/yidai//img/1site_bloqade2.png)


This is the picture made by Bloqade.jl, which is as same as the Bloqade documentation's  result. You can see this code in `/YIDAI/juliacode/sample_1site_bloqade.jl`. The result is very clear.
(**One mistake? $\Omega$ = 2pi rather than 2pi*0.5 ?**)

Besides, we can also use the Itensor.jl to simulate the Rydberg blockade. The following code is an example of simulating the Rydberg blockade in `/YIDAI/juliacode/2sites_bloqade.jl` and `/YIDAI/juliacode/2sites_itensor.jl`. The result is:
![](/4.simulation/yidai//img/2sites_bloqade.png)

We can see it clearly that the Rydberg blockade is obvious in the picture. The two atoms can't be in the Rydberg state at the same time, and the result obtained from Itensor.jl is very similar to the Bloqade.jl's result,which means that the Itensor.jl is also a good tool to simulate the Rydberg blockade in 2 sites case. For more sites, we have explored the 6sites case and the 12 sites case, and the results are shown in the following codes:
- 6 sites case: `/YIDAI/juliacode/6sites_bloqade.jl` and `/YIDAI/juliacode/6sites_itensor.jl`
- 12 sites case: `/YIDAI/juliacode/12sites_bloqade.jl`
  

### Conclusion
In this part, we learn about what are the rydberg atoms, and how to use the Hamiltonian to describe the quantum dynamic of Rydberg atoms. We also learn about the Rydberg blockade, which is a very important phenomenon in the Rydberg atoms. We can use the Bloqade.jl to simulate the Rydberg blockade, and the result is very similar to the result obtained from Itensor.jl. So we can explore more possibilities of using different tools to solve the Rydberg atoms problems and see their dynamic behaviors in the future.

## Quantum Scar
### Background
The experimental discovered that if one starts with a particular initial state (e.g. the Neel state), the Rydberg blockade constraint results into persistent revivals of quantum dynamics, in constrast to the expectation of reaching thermalization quickly. Later, theoretical studies (e.g. C. J. Turner, et al.) reveal that this behavior is due to special eigenstates embedded in the quantum many-body spectrum, and the phenomenon is called quantum many-body scars.

Quantum many-body scars are analogous to the phenomenon of classical scars in single-particle quantum chaos, where scars represent a concentration of some eigenfunctions along the trajectory of classical periodic orbits. Similarly, in the quantum many-body case, the initial Neel state has a large component of these specific scar states. Under the time evolution of the Rydberg Hamiltonian, the initial state undergoes the trajectory of periodic quantum orbits. The non-thermal behavior is mainly caused by such non-ergodicity in the Hilbert space.

### Example
In this example, we use Bloqade to simulate the evolution of a fully coherent, strongly interacting Rydberg system. We demonstrate the persistent revivals of many-body dynamics with measurements of the Rydberg density and entanglement entropy. You can see more information and details from my code in `/YIDAI/juliacode/Bloqadescar.jl`

We define an 1D chain with 9 Rydberg atoms, and the distance between atoms is 5.72 μm. The Rabi frequency and detuning are set to be as follows:

![](/4.simulation/yidai//img/prepare_Neel_state.png)

We set the initial state to be the Neel state, and the time evolution is simulated with the Rydberg Hamiltonian, to show the dynamic behavior about the Rydberg atoms. The Rydberg density and entanglement entropy are measured at each time step. The results are shown below:
For 9 sites case: 
![](/4.simulation/yidai//img/state_evolves.png)

The result is very clear, we can see the dynamic behavior of the Rydberg atoms, and the persistent revivals of many-body dynamics. The result is very similar to the result obtained from the Bloqade documentation.

For 13 sites case:
![](/4.simulation/yidai//img/state_evolves13.png)

The result is also very clear, and we can see the dynamic behavior of the Rydberg atoms, and the persistent revivals of many-body dynamics. 

We can also plot the entanglement as a function of time:
9 sites case:
![](/4.simulation/yidai//img/entanglement_entropy.png)
13 sites case:
![](/4.simulation/yidai//img/entanglement_entropy13.png)

We also find that if we change the frequency of the Rabi frequency and switch the dutuning of the system, the result will be different. For example, if we set the Rabi frequency to be 2π * 0.5 MHz, the result will be different. The result is shown in the following picture:
![](/4.simulation/yidai//img/state_evolves_bad.png)
It shows that the system is not in the right state, and the result is not as good as the previous one. We must choose the right parameters to get the correct result, or the result will be bad.

We also pay attention to the initial state, if we change the initial state to be the random state, the result will be different. The result is shown in the following picture:
In 9 sites case:
![](/4.simulation/yidai//img/diffenent_initial_state.png)
In 13 sites case:
![](/4.simulation/yidai/img/diffenent_initial_state13.png)
### Conclusion
In this part, we learn about the quantum scar, which is a very important phenomenon in the Rydberg atoms. We can use the Bloqade.jl to simulate the quantum scar, and we can observe the dynamic behavior of Rydberg atoms in 1D chain cases. We can also measure the Rydberg density and entanglement entropy to see the dynamic behavior of the Rydberg atoms. We can also change the parameters of the system (Rabi frequency, detuning) to see the different results. We can also change the initial state to see the different results. So we can explore more possibilities of using Bloqade.jl to have a better understanding of the quantum scar.

## Other works
I have also done some other works about the Rydberg atoms, such as the simulation of the field map, some practices about matrix product states(MPS), The results are shown in the following codes and pictures: 
- `/YIDAI/juliacode/mpstraining.jl`
- `/YIDAI/juliacode/quantumscararrow.jl`
- `YIDAI/img/fieldmap1.png`
- `YIDAI/img/fieldmap2.png`

## References

1. https://queracomputing.github.io/Bloqade.jl
2. https://github.com/QuEraComputing/Bloqade.jl
3. Giudici, G., Surace, F.M., Pichler, H., 2023. Unraveling PXP Many-Body Scars through Floquet Dynamics.
4. Bluvstein, D., Omran, A., Levine, H., Keesling, A., Semeghini, G., Ebadi, S., Wang, T.T., Michailidis, A.A., Maskara, N., Ho, W.W., Choi, S., Serbyn, M., Greiner, M., Vuletić, V., Lukin, M.D., 2021. Controlling quantum many-body dynamics in driven Rydberg atom arrays. Science 371, 1355–1359. Choi, S., Turner, C.J., Pichler, H., Ho, W.W., Michailidis, A.A., Papić, Z., Serbyn, M., Lukin, M.D., Abanin, D.A., 2019. Emergent SU(2) Dynamics and Perfect Quantum Many-Body Scars. Phys. Rev. Lett. 122, 220603.
5. Ho, W.W., Choi, S., Pichler, H., Lukin, M.D., 2019. Periodic Orbits, Entanglement, and Quantum Many-Body Scars in Constrained Models: Matrix Product State Approach. Phys. Rev. Lett. 122, 040603.
6. https://itensor.github.io/ITensors.jl/dev/
7. https://github.com/ITensor/ITensors.jl/blob/main/docs/src/index.md
















