---
layout: page
permalink: /research/
title: Research
description: Physical grounding for AI trust — attestation through physics, not statistics alone.
nav: true
nav_order: 2
---

<style>
.post article h2 { margin-top: 2.6rem; }
.research-figure { margin: 1.6rem auto; text-align: center; }
.research-figure img { width: 100%; max-width: 640px; height: auto; }
.research-paper {
  font-size: 0.92rem;
  border-left: 3px solid var(--global-theme-color);
  padding: 0.5rem 0 0.5rem 1rem;
  margin: 1.1rem 0 0.6rem;
  color: var(--global-text-color-light);
}
.research-lead { font-size: 1.04rem; }
</style>

<p class="research-lead">The I-SEC Lab studies how to prevent AI systems from acting on fabricated realities by anchoring digital intelligence to physical-world evidence. As AI increasingly generates content and drives consequential decisions, the load-bearing question shifts from <em>"is this output good?"</em> to <em>"is the input real?"</em> Our answer is a single doctrine, pursued across four research thrusts.</p>

## The Physical-Anchoring Doctrine

Statistical detectors can always be evaded: an adversary who knows a classifier's architecture can craft content that defeats it, and every new generative model restarts the race. The lab's response is to stop asking whether content *looks* authentic and start asking whether it was *physically present* at a verifiable event. We call this distinction **attestation, not detection** — detection produces a probability, attestation produces evidence.

The resilience of this approach comes from being a *system*, not a single signal. No individual environmental fingerprint is permanently unforgeable. What is hard to defeat is a coherent set of conditions an attacker must satisfy *simultaneously*: reproduce multiple physical anchors that agree with one another, maintain real-time interactive coherence, defeat capture-time hardware attestation, and survive independent verification against authoritative references. Each added anchor multiplies the adversary's cost. Trust, in our work, is grounded in physics rather than in statistics alone.

<figure class="research-figure">
  <img src="{{ '/assets/img/research-doctrine.svg' | relative_url }}" alt="Diagram of the physical-anchoring doctrine: digital claims verified against a physical-anchoring layer of environmental fingerprints, tied to a verified physical-world event.">
</figure>

The four thrusts below apply this doctrine at different points in the pipeline — from authenticating a single recording, to detecting synthetic media, to gating the actions of autonomous agents, to securing full cyber-physical systems.

## 1. ENF Authentication

The Electric Network Frequency (ENF) is the instantaneous frequency of the AC power grid. Although the grid runs at a nominal 60 Hz in North America, continuous imbalances between load and generation cause small, unpredictable fluctuations of roughly ±0.1 Hz. These fluctuations are synchronized across an entire grid region and are passively embedded into audio and video recorded near powered devices — through acoustic hum and through electromagnetic interference picked up by camera hardware. The result is a temporal fingerprint that cannot be reproduced from a mathematical model and that no recording can opt out of carrying.

The lab builds the full pipeline that turns this signal into an authenticator: extracting ENF from a media file, aligning it, and comparing it against a time-stamped reference database to confirm whether a recording was made when and where it claims. We have shown that ENF cannot be predicted or forged by standard time-series or machine-learning methods, and we study its real-world reliability honestly — ENF is powerful where it can be extracted, and is best deployed as one anchor within a multi-modal system. This thrust underpins surveillance-feed integrity, video-conferencing deepfake detection, and physically-grounded blockchain consensus.

<figure class="research-figure">
  <img src="{{ '/assets/img/research-enf.svg' | relative_url }}" alt="Pipeline showing power-grid frequency embedded in recordings, ENF extraction, comparison against a reference database, and a match or mismatch verdict.">
</figure>

<p class="research-paper"><strong>Representative work.</strong> N. Poredi, D. Nagothu, Y. Chen, X. Li, A. Aved, E. Ardiles-Cruz, and E. Blasch, "Robustness of Electrical Network Frequency Signals as a Fingerprint for Digital Media Authentication," <em>IEEE 24th International Workshop on Multimedia Signal Processing (MMSP)</em>, 2022. &middot; R. Xu, D. Nagothu, and Y. Chen, "Decentralized Video Input Authentication as an Edge Service for Smart Cities," <em>IEEE Consumer Electronics Magazine</em>, 2021.</p>

## 2. Deepfake & AI-Generated Content Detection

Generative models now produce synthetic images, audio, and video that are convincing to both people and conventional detectors. A detector trained on today's generators is steadily outrun by tomorrow's, so the lab grounds detection in features that do not depend on any particular generator. We combine the topological structure of an image under forgery (persistent homology), frequency-domain statistics such as DCT coefficients and Benford's-law deviations, spatial-patch forensics, the ENF physical anchor, and temporal-consistency cues across video frames.

These signals are fused in a multi-modal architecture that runs on-device, so that authentication works under low-connectivity and privacy-sensitive conditions. The design rationale is the doctrine in miniature: defeating the system requires forging every physical and structural channel at once, and topological and physical features remain valid as generative models advance — there is no detector-retraining race to lose.

<figure class="research-figure">
  <img src="{{ '/assets/img/research-deepfake.svg' | relative_url }}" alt="Multi-modal deepfake detection: input media fans out to frequency-domain, spatial-patch, ENF, and temporal branches that are combined in a fusion layer producing a real-or-AI-generated verdict.">
</figure>

<p class="research-paper"><strong>Representative work.</strong> V. T. Pham, H. Lakadawala, A. Delgado, M. Cortez, L. Chen, and Y. Chen, "CerVaLens: On-Device Multimodal AI-Generated Content Detection for Mobile Authentication," <em>SPIE Defense + Commercial Sensing</em>, 2026. &middot; D. Nagothu, R. Xu, Y. Chen, E. Blasch, and A. Aved, "DeFakePro: Decentralized DeepFake Attacks Detection Using ENF Authentication," <em>IEEE IT Professional</em>, 2022.</p>

## 3. Environmental Attestation for AI Agents

When an AI agent is about to take a consequential action, a detector's confidence score is not a sound basis for authorization. This thrust reframes agent security around attestation: before acting, an agent should be able to request and verify structured, hardware-signed evidence that its perception is grounded in the physical world. The need is sharpest where agents coordinate through the Model Context Protocol (MCP) and similar tool interfaces, a control surface an adversary can exploit with spoofed sensors or deepfaked measurements, leaving an agent's decisions internally consistent yet decoupled from physical reality.

We formalize the evidence an agent should demand as an Environmental Attestation Token (EnvAT), a compact object that packages digests of multiple physical anchors, extraction metadata, temporal validity bounds, device identity, and a trusted-execution-environment signature. Unlike a classifier output, the token is an evidence object that can travel across system boundaries and be checked in constant time. An agent verifies the token against policy and gates its behavior accordingly: act, escalate for review, or refuse, separating evidence production from decision-making and replacing "probability of authenticity" with hardware-bound proof of physical grounding.

Our PAMOS framework is an early, concrete realization of this request-verify-gate loop. It defines a four-phase trust protocol that gates MCP tool permissions on a weighted score over multiple environmental fingerprints, power-grid, acoustic, RF, visual, and inertial, validated on a UAV-swarm testbed with end-to-end verification in roughly 120 milliseconds. A companion survey maps the broader landscape this thrust addresses: the environmental, deepfake, and MCP-mediated attack surfaces of AI agents in cyber-physical systems, and a lifecycle-aware methodology for selecting defenses against them.

<figure class="research-figure">
  <img src="{{ '/assets/img/research-attestation.svg' | relative_url }}" alt="Loop showing an AI agent requesting environmental evidence, sensors capturing anchors over a trusted path, a hardware-signed EnvAT token returned, and the agent verifying it before choosing to act, escalate, or refuse.">
</figure>

<p class="research-paper"><strong>Representative work.</strong> V. T. Pham, H. Lakadawala, Y. Chen, and E. Blasch, "Physically Anchored Trust for MCP-Orchestrated AIoT Swarms," <em>International Conference on Information Fusion (FUSION)</em>, 2026. &middot; M. Hatami, V. T. Pham, H. Lakadawala, and Y. Chen, "Securing AI Agents in Cyber-Physical Systems: A Survey of Environmental Interactions, Deepfake Threats, and Defenses," arXiv:2601.20184, 2026.</p>

## 4. Trust for Cyber-Physical Systems

Cyber-physical systems — smart grids, UAV swarms, and the digital twins that mirror them — couple physical processes to AI-driven decision loops. That coupling is exactly what an adversary attacks: false data injection, sensor spoofing, and deepfaked measurements can leave a digital twin internally consistent yet decoupled from the reality it claims to represent.

The lab closes this gap by anchoring every layer of the cyber-physical stack — sensing, consensus, key distribution, and agent decisions — to physical observables, so that a virtual model stays continuously coupled to the physical system. This thrust contributes a lifecycle-aware methodology for selecting defenses against the timing and resource constraints real deployments impose, and demonstrates physically-anchored authentication in concrete settings such as smart-grid digital twins and multi-agent swarms. The unifying idea, which we call physical-to-virtual (P2V) trust, treats physical grounding as a runtime requirement of the system rather than an after-the-fact forensic check.

<figure class="research-figure">
  <img src="{{ '/assets/img/research-cps.svg' | relative_url }}" alt="A cyber-physical control loop in which the sensing path from the physical system to its digital twin passes through a physical-anchoring trust layer that rejects mismatched, spoofed, or deepfaked data.">
</figure>

<p class="research-paper"><strong>Representative work.</strong> M. Hatami, Q. Qu, Y. Chen, J. Mohammadi, E. Blasch, and E. Ardiles-Cruz, "ANCHOR-Grid: Authenticating Smart Grid Digital Twins Using Real-World Anchors," <em>Sensors</em>, MDPI, 2025. &middot; S. Ogunbunmi, S. Pal, E. Blasch, Y. Chen, and G. Chen, "BRAIN: Blockchain Reputation Architecture for Interest-flooding Neutralization in Named Data Networking for Internet of Things," <em>IEEE International Conference on Pervasive Computing and Communications (PerCom)</em>, 2026.</p>

## Applications

The doctrine is a spine, not a silo: the same physical-anchoring methods reach into the application domains where verifiable trust matters most, and they account for parts of the lab's publication record that the four thrusts do not name directly. In healthcare, the lab grounds virtual-care and elder-safety monitoring in environmental fingerprints — SAVE authenticates patient avatars through the ambient ENF of the patient's own home, and the Internet of Physical-Virtual Things (IoPVT) keeps outdoor safety monitoring trustworthy when individual sensors drop out. In urban cyber-physical systems, the same anchors secure smart-grid digital twins and the sensing fabric of smart cities, where a single corrupted measurement can propagate into a real-world control decision. These verticals are not separate research lines but the one doctrine applied wherever the gap between a digital claim and physical reality carries real consequences.

Together, these thrusts form one research program: a trust infrastructure that ties digital intelligence back to verifiable physical evidence. Prospective students and collaborators interested in any of these directions are encouraged to [get in touch](mailto:ychen@binghamton.edu).
