# The above line tells the notebook to write the rest of the cell content to a file draw_eight.py

import numpy as np
import matplotlib.pyplot as plt

def make_figure():
    theta = np.linspace(0, 2 * np.pi, 100)
    fig, ax = plt.subplots(figsize=(3, 6))
    ax.plot(np.sin(2 * theta) / 2, np.cos(theta))
    return fig
