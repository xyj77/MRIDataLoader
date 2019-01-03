# -*- coding:utf-8 -*-
from base.base_data_loader import BaseDataLoader

import os
import numpy as np
from PIL import Image
import scipy.io as sio
from SampleData import sampledata

import torch
from torchvision import transforms

class MRINPY(BaseDataLoader):

    def __init__(self, config, train = True, transform=None, target_transform=None):
        super(MRINPY, self).__init__(config)
        self.train = train
        self.transform = transform
        self.target_transform = target_transform
        
        self.path = os.path.join(config.data_path, config.data_type)
        self.Num_train = config.Num_train
        self.Num_test = config.Num_test
        self.model_type = config.exp_name 
        self.isAug = config.isAug
        
        # if config.classes == 2:   # 二分类：I、II  &  III、IV
            # self.target_transform = self.binary
        
        #提取指定模态数据并进行预处理
        self.dict = config.dict
        self.Fusion = config.Fusion
        
        if self.train:
            (self.train_data, self.train_labels) = self.loadData(self.train, config.isSample)
            self.train_labels = torch.from_numpy(self.train_labels).type(torch.LongTensor)
        else:
            (self.test_data, self.test_labels) = self.loadData(self.train, config.isSample)
            self.test_labels = torch.from_numpy(self.test_labels).type(torch.LongTensor)
            
    def __getitem__(self, index):
        """
        Args:
            index (int): Index
        Returns:
            tuple: (image, target) where target is index of the target class.
        """
        if self.train:
            img, target = self.train_data[index], self.train_labels[index]
        else:
            img, target = self.test_data[index], self.test_labels[index]

        # doing this so that it is consistent with all other datasets
        # 提取融合数据
        img = self.extrData(img, self.dict, self.Fusion)
        
        # img = Image.fromarray(img, mode='L')
        img = Image.fromarray(img, mode='RGB')
        if self.transform is not None:
            img = self.transform(img)

        if self.target_transform is not None:
            target = self.target_transform(target)
            
        return img, target
        
    def __len__(self):
        if self.train:
            return len(self.train_data)
        else:
            return len(self.test_data)
        
    def binary(self, target):
        if target < 2:
            return 0
        else:
            return 1

    def getData(self, train=True, array=True):
        if train:
            if array:
                return self.train_data.numpy(), self.train_labels.numpy()
            else:
                return self.train_data, self.train_labels
        else:
            if array:
                return self.test_data.numpy(), self.test_labels.numpy()
            else:
                return self.test_data, self.test_labels

    def loadData(self, train, isSample):
        path = str(self.path) 
        if train:
            if isSample:
                Num_train = self.Num_train
                sampledata(path+'/train.txt', Num_train, 0, path+'/trainSample.txt') 
                fp = open(os.path.join(path, "trainSample.txt"), 'r')
            else:
                fp = open(os.path.join(path, "train.txt"), 'r')
        else:
            if isSample:
                Num_test = self.Num_test
                sampledata(path+'/test.txt', Num_test, 0, path+'/testSample.txt')
                fp = open(os.path.join(path, "testSample.txt"), 'r') 
            else:
                fp = open(os.path.join(path, "test.txt"), 'r')
            
        data = []  
        labels = []  
            
        line = fp.readline()
        while len(line):
            Level = int(line[0])
            imgpath = line[2:-1]
            mat = np.load(imgpath)
            # mat = Image.open(imgpath) 
                
            data.append(mat)
            labels.append(Level)
            line = fp.readline()
            
        fp.close()
        return (data, np.array(labels, dtype='float32'))
    
    def extrData(self, img, dict, Fusion):
        image = []
        for modual in Fusion:
            image.append(img[:,:,dict[modual]])
        return np.array(image)
    
if __name__ == "__main__":
    pass
    