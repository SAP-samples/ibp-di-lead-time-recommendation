import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd



def plot_lead_times(lead_time, histplot_stat='count', xmax=None, ymax=None, plot_title='Lead time (in data)'):
    lts = lead_time[['LOCID', 'LT']]
    lts = lts.astype({'LT': float})
    sns.set()
    fig, axes = plt.subplots(1, 1)
    fig.tight_layout()
    # plt.figure(figsize=(12, 8))
    fig.suptitle(plot_title)
    name = "LT [d]"
    df_ij = pd.DataFrame({name: lts["LT"]})
    df_ij = df_ij[df_ij[name] < xmax]
    #plt.hist(df_ij, bins=1000)
    sns.histplot(df_ij, x=name, bins=1000, kde=False, stat=histplot_stat).margins(0, 0)
    axes.set_ylim(0, ymax)
    axes.set_xlim(0, xmax)
    plt.show()
