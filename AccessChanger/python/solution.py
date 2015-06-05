import unittest
class AccessChanger:
    
    def convert(self, program):
        """
        Returns a list of strings with '->' replaced by '.' unless the former are included in a comment
        """
        answer = []
        for line in program:
            new_line = []
            in_comment = False
            last_was_arrow = False
            for i in range(len(line)):
                
                if last_was_arrow:
                    last_was_arrow = False
                    continue
                if line[i] == '-' and not in_comment:
                    if self.is_arrow(i, line):
                        last_was_arrow = True
                        new_line.append('.')
                    else:
                        new_line.append('-')
                elif line[i] == '/' and not in_comment:
                    new_line.append('/')
                    if self.is_comment(i, line):
                        in_comment = True
                else:
                    new_line.append(line[i])
            answer.append(''.join(char for char in new_line))
        return tuple(answer)
    
    def is_arrow(self, index, line):
        """
        Returns whether the given index in the line is the first part of an arrow
        """
        if index >= len(line) - 1:
            return False
        else:
            return line[index] == '-' and line[index+1] == '>'
                    
    def is_comment(self, index, line):
        """
        Returns whether the given index in the line is the first part of a comment
        """
        if index >= len(line) - 1:
            return False
        else:
            return line[index] == '/' and line[index+1] == '/'

class TestAccessChanger(unittest.TestCase):

    def setUp(self):
        self.access_changer = AccessChanger()
        self.test = ("Test* t = new Test();", 
                     "t->a = 1;", 
                     "t->b = 2;",
                     "t->go(); // a=1, b=2 --> a=2, b=3")


        self.answer = ("Test* t = new Test();", 
                       "t.a = 1;", 
                       "t.b = 2;", 
                       "t.go(); // a=1, b=2 --> a=2, b=3")

        self.test2 = ("---> // the arrow --->", 
                      "---", 
                      "> // the parted arrow")
        self.answer2 = ("--. // the arrow --->",
                        "---", 
                        "> // the parted arrow")



    def test_basic(self):
        solution = self.access_changer.convert(self.test)
        self.assertTrue(solution == self.answer)

    def test_two(self):
        solution = self.access_changer.convert(self.test2)
        self.assertTrue(solution == self.answer2)

if __name__ == '__main__':
    unittest.main()
