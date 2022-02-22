import matplotlib.pyplot as plt
from sklearn import datasets
import numpy as np
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
import pandas as pd
from sklearn import neighbors, metrics
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score
from sklearn.preprocessing import scale
from sklearn import cluster
from cluster import kMeans

bc=load_breast_cancer()
x=scale(bc.data)
y=bc.target
x_train,y_train,x_test,y_test=train_test_split(x,y,test_size=0.2)
model=kMeans(n_clusters=2,random_state=0)
model.fit(x_train)
predictions=model.predict(x_test)
labels=model.labels_
print('labels',labels)


