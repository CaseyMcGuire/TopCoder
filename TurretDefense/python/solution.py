
class TurretDefense:
    
    #RUNTIME: O(n) where n is the length of xs/ys/times
    def firstMiss(self, xs, ys, times):
        """
        Returns the first target that can't be shot down
        """
        #our beginning coordinate and time
        time = 0
        cur_coord = (0,0)

        for i in xrange(len(xs)):
            x, y = cur_coord

            time_to_move = abs(xs[i] - x) + abs(ys[i] - y)
            time_of_arrival = time_to_move + time
            if time_of_arrival > times[i]:
                return i
            
            time = times[i]
            cur_coord = (xs[i], ys[i])
        
        return -1

        

if __name__ == "__main__":
    solution = TurretDefense()
    print solution.firstMiss((3,5,6), (7,5,6), (11,15,16))
    print solution.firstMiss((1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16), (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16), (2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32))
