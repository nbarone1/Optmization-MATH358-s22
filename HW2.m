%%% 358 HW2 Problem A

%%% Companies A,B,C have costs associated with 
%%% Music (m), Chef (ch), and Cleaning (cl)
%%% minimizing the cost of matching each company to a task
%%% min(108am+125ach+150acl+150bm+148bch+175bcl+122cm+148ch+250cl)
%%% variables are 0 or 1
%%% each company can do one task, each task can have one company
%%% sum of a's = 1, sum of xm's = 1, etc. etc.

%%% c function to minimize with c*x

c = [108, 125, 150, 150, 148, 175, 122, 148, 250];

%%% use Aeq, beq instead of inequalities.

Aeq = [1,1,1,0,0,0,0,0,0;
        0,0,0,1,1,1,0,0,0;
        0,0,0,0,0,0,1,1,1;
        1,0,0,1,0,0,1,0,0;
        0,1,0,0,1,0,0,1,0;
        0,0,1,0,0,1,0,0,1;];

beq = ones(6,1);

%%% lower bound 0, upper bound covered in Aeq*x=beq

x = intlinprog(c,ones(9,1),[],[],Aeq,beq,zeros(9,1))

%%% A does cleaning, B does chef, C does music

cost = c*x

%%% minimum cost is $420


%%% 488 HW2 Problem A

%%% Minimum edge cover
%%% 6 nodes, 9 edges
%%% edges are: a-b,a-c,a-e,b-c,b-d,b-e,c-e,d-e,d-f
%%% a-f correspond to 0-5 respectively in the picture
%%% each node can be 1 or 0, each edge sum of nodes and >=1
%%% *-1 to get <= -1

%%% c function to minimize with c*x

c = [1,1,1,1,1,1];

%%% A*x<=b

A = [-1,-1,0,0,0,0;
    -1,0,-1,0,0,0;
    -1,0,0,0,-1,0;
    0,-1,-1,0,0,0;
    0,-1,0,-1,0,0;
    0,-1,0,0,-1,0;
    0,0,-1,-1,0,0;
    0,0,0,-1,-1,0;
    0,0,0,0,-1,-1];

b = [-1;-1;-1;-1;-1;-1;-1;-1;-1];

%%% lower bound is 0, upper bound is one

x = intlinprog(c,ones(6,1),A,b,[],[],zeros(6,1),ones(6,1))

%%% nodes b,c,e or 1,2,4 are optimal, so answer is 3 nodes

%%% Common sense sketching says those 3 nodes are apart of every edge.
%%% Since each edge requires only one node, choosing the node based on
%%% which node connects to the most uncovered edges, e makes sense, then
%%% chosing the next node covering the most uncovered edges is the b node,
%%% and lastly the c node covers the remaining edges.