with open("main_nerf.py", "a") as f:
    f.write('\n\n    torch.save(model, "/opt/instant_ngp/torch-ngp/trial_nerf/results/nerf_model.pt")')