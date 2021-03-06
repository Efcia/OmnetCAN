//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

package omnetcan.networks;

import omnetcan.node.Node;

network Mesh
{
    parameters:
        double height @prompt("Number of rows") = default(5);
        double width @prompt("Number of columns") = default(5);
    types:
        channel C extends ned.DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Gbps;
        }
    submodules:
        node[height*width]: Node {
            parameters:
                address = index;
                @display("p=,,m,$width,40,40");
            gates:
                face[4];
        }
    connections allowunconnected:
        for i=0..height-1, for j=0..width-1 {
            node[i*width+j].face[0] <--> C <--> node[(i+1)*width+j].face[1] if i!=height-1;
            node[i*width+j].face[2] <--> C <--> node[(i*width+j)+1].face[3] if j!=width-1;
        }
}


