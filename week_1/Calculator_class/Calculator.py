class Calculator():
    
    def __init__(self, data):
        self.data = data
        
#     def reset(self):
#         self.__init__(self.data)
    @property
    def length(self):
        return len(self.data)
    
    @property
    def mean(self):
        return sum(self.data)/len(self.data)

    @property
    def median(self):
        #if self.length is odd
        self.data.sort()
        if self.length % 2 == 1:
            return self.data[int((self.length)/2)]
            
        
        else:
            return (self.data[((self.length)//2)] + self.data[((self.length) // 2)-1])/2
            
    @property
    def variance(self):
        return sum(((x - self.mean)**2) for x in self.data) / (len(self.data))
    
    @property
    def stand_dev(self):
        return (sum(((x - self.mean)**2) for x in self.data) / (len(self.data)))**.5
         
        
    def add_data(self, more_data):
        if type(more_data) == list:
            return self.data.extend(more_data)
            self.reset()
        else:
            return self.data.append(more_data)
            self.reset()
        
    def remove_data(self, item):
        return self.data.remove(item)
    
    