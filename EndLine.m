function [Walls, Colors] = EndLine()

Walls = [0,0,1,0;
         0,0,0,1;
         0,1,0,2;
         0,2,0,3;
         0,3,0,4;
         0,4,0,5;
         0,5,0,6;
         1,0,1,1;
         1,1,1,2;
         1,2,1,3;
         1,3,1,4;
         1,4,1,5;
         1,5,1,6;
         0,6,1,6;]';

Colors = [0,0,0;
           99/256, 99/256, 99/256;
          137/256,137/256,137/256;
          115/256,115/256,115/256;
           99/256, 99/256, 99/256;
          137/256,137/256,137/256;
          115/256,115/256,115/256;
           87/256, 87/256, 87/256;
          107/256,107/256,107/256;
          125/256,125/256,125/256;
           87/256, 87/256, 87/256;
          107/256,107/256,107/256;
          125/256,125/256,125/256;
          0,0,0;]';