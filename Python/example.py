#-*- coding:utf-8 -*-
from __future__ import print_function

from scipy.misc import imsave
from PIL import Image
import numpy as np
margin = 3
dict = {"A": 0, "B": 1, "K": 2, "E": 3, "F": 4, "G": 5, "H": 6, "I": 7, "J": 8}

def save_gray(imgs, (k_w, k_h)):
    n_in, k_n = len(imgs), imgs[0].shape[2]
    width = k_w * k_n + (k_n - 1) * margin
    height = k_h * n_in + (n_in - 1) * margin
    stitched_filters = np.ones((height, width))

    # fill the picture with our saved filters
    for j, img in enumerate(imgs):
        for i in range(k_n):
            x = Image.fromarray(img[:,:,i]).resize((k_w, k_h), Image.ANTIALIAS)
            stitched_filters[(k_w+margin)*j: (k_w+margin)*j + k_w,
                             (k_h+margin)*i : (k_h+margin)*i+k_h] = x
    # save the result to disk
    imsave('./gray.png', stitched_filters)
    return stitched_filters
    
def save_rgb(imgs, fusion, (k_w, k_h)):
    n_in, k_n = len(imgs), len(fusion)
    width = k_w * k_n + (k_n - 1) * margin
    height = k_h * n_in + (n_in - 1) * margin
    stitched_filters = np.ones((height, width, 3))
    
    # fill the picture with our saved filters
    for j, img in enumerate(imgs):
        for i, f in enumerate(fusion):
            x = np.ones((k_w, k_h, 3))
            x[:,:,0] = Image.fromarray(img[:,:,dict[list(f)[0]]]).resize((k_w, k_h), Image.ANTIALIAS)
            x[:,:,1] = Image.fromarray(img[:,:,dict[list(f)[1]]]).resize((k_w, k_h), Image.ANTIALIAS)
            x[:,:,2] = Image.fromarray(img[:,:,dict[list(f)[2]]]).resize((k_w, k_h), Image.ANTIALIAS)
            stitched_filters[(k_w+margin)*j: (k_w+margin)*j + k_w,
                             (k_h+margin)*i: (k_h+margin)*i+k_h, :] = x
    # save the result to disk
    imsave('./color.png', stitched_filters)
    return stitched_filters
    
def imgJoin(gray, color):
    width = gray.shape[1] + color.shape[1] + margin
    height = gray.shape[0]
    stitched_filters = np.ones((height, width, 3))
    stitched_filters[:,:gray.shape[1],0] = gray
    stitched_filters[:,:gray.shape[1],1] = gray
    stitched_filters[:,:gray.shape[1],2] = gray
    stitched_filters[:,gray.shape[1]+margin:,:] = color
    # save the result to disk
    imsave('./join.png', stitched_filters)
    
def main():
    imgs = []
    mat = np.load('./02170343_1_0_ABKEFGHIJ_0_0.npy')
    imgs.append(mat)
    mat = np.load('./02170343_1_0_ABKEFGHIJ_1_3.npy')
    imgs.append(mat)
    mat = np.load('./13212676_1_0_ABKEFGHIJ_0_0.npy')
    imgs.append(mat)
    mat = np.load('./13212676_1_0_ABKEFGHIJ_2_2.npy')
    imgs.append(mat)
    mat = np.load('./13213503_1_0_ABKEFGHIJ_0_0.npy')
    imgs.append(mat)
    mat = np.load('./13213503_1_0_ABKEFGHIJ_3_2.npy')
    imgs.append(mat)
    
    gray = save_gray(imgs, (64, 64))
    fusion = ['ABK', 'EGI' , 'AGI']
    color = save_rgb(imgs, fusion, (64, 64))
    imgJoin(gray, color)
    
if __name__ == "__main__":
    main()