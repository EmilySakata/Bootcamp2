# activity2.py

import os
import csv


resource_path = os.path.join(os.getcwd(), "Resources")




filepaths = []
for file in os.listdir(resource_path):
    if file.endswith(".csv"):
        filepaths.append(os.path.join(resource_path, file))


source = "Resources"
destination = src_dir
for root, _, files in os.walk("Resources"):
    for file in files:
        if file.endswith(".csv"):
            filepath = os.path.abspath(os.path.join(root, file))
            shutil.copy(filepath, destination)
