\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  Theta[0]
Subject To
 PathConstr1[start_0,fork0]: 100 Rc[start_0,fork0] - Tin[start_0,fork0]
   + Tout[start_0,fork0] >= 0
 PathConstr1[fork0,constant1]: 100 Rc[fork0,constant1]
   - Tin[fork0,constant1] + Tout[fork0,constant1] >= 0
 PathConstr1[fork0,control_merge2]: 100 Rc[fork0,control_merge2]
   - Tin[fork0,control_merge2] + Tout[fork0,control_merge2] >= 0
 PathConstr1[constant1,fork1]: 100 Rc[constant1,fork1]
   - Tin[constant1,fork1] + Tout[constant1,fork1] >= 0
 PathConstr1[fork1,extsi4]: 100 Rc[fork1,extsi4] - Tin[fork1,extsi4]
   + Tout[fork1,extsi4] >= 0
 PathConstr1[fork1,extsi5]: 100 Rc[fork1,extsi5] - Tin[fork1,extsi5]
   + Tout[fork1,extsi5] >= 0
 PathConstr1[extsi4,mux2]: 100 Rc[extsi4,mux2] - Tin[extsi4,mux2]
   + Tout[extsi4,mux2] >= 0
 PathConstr1[extsi5,mux1]: 100 Rc[extsi5,mux1] - Tin[extsi5,mux1]
   + Tout[extsi5,mux1] >= 0
 PathConstr1[oehb5,tehb6]: 100 Rc[oehb5,tehb6] - Tin[oehb5,tehb6]
   + Tout[oehb5,tehb6] >= 0
 PathConstr1[tehb6,mux2]: 100 Rc[tehb6,mux2] - Tin[tehb6,mux2]
   + Tout[tehb6,mux2] >= 0
 PathConstr1[mux2,fork2]: 100 Rc[mux2,fork2] - Tin[mux2,fork2]
   + Tout[mux2,fork2] >= 0
 PathConstr1[fork2,extsi6]: 100 Rc[fork2,extsi6] - Tin[fork2,extsi6]
   + Tout[fork2,extsi6] >= 0
 PathConstr1[fork2,extsi7]: 100 Rc[fork2,extsi7] - Tin[fork2,extsi7]
   + Tout[fork2,extsi7] >= 0
 PathConstr1[fork2,extsi8]: 100 Rc[fork2,extsi8] - Tin[fork2,extsi8]
   + Tout[fork2,extsi8] >= 0
 PathConstr1[extsi6,addi1]: 100 Rc[extsi6,addi1] - Tin[extsi6,addi1]
   + Tout[extsi6,addi1] >= 0
 PathConstr1[extsi7,subi1]: 100 Rc[extsi7,subi1] - Tin[extsi7,subi1]
   + Tout[extsi7,subi1] >= 0
 PathConstr1[extsi8,mc_load0]: 100 Rc[extsi8,mc_load0]
   - Tin[extsi8,mc_load0] + Tout[extsi8,mc_load0] >= 0
 PathConstr1[tehb2,mux1]: 100 Rc[tehb2,mux1] - Tin[tehb2,mux1]
   + Tout[tehb2,mux1] >= 0
 PathConstr1[oehb6,tehb7]: 100 Rc[oehb6,tehb7] - Tin[oehb6,tehb7]
   + Tout[oehb6,tehb7] >= 0
 PathConstr1[tehb7,mux1]: 100 Rc[tehb7,mux1] - Tin[tehb7,mux1]
   + Tout[tehb7,mux1] >= 0
 PathConstr1[mux1,addi0]: 100 Rc[mux1,addi0] - Tin[mux1,addi0]
   + Tout[mux1,addi0] >= 0
 PathConstr1[oehb7,control_merge2]: 100 Rc[oehb7,control_merge2]
   - Tin[oehb7,control_merge2] + Tout[oehb7,control_merge2] >= 0
 PathConstr1[control_merge2,oehb0]: 100 Rc[control_merge2,oehb0]
   - Tin[control_merge2,oehb0] + Tout[control_merge2,oehb0] >= 0
 PathConstr1[control_merge2,tehb0]: 100 Rc[control_merge2,tehb0]
   - Tin[control_merge2,tehb0] + Tout[control_merge2,tehb0] >= 0
 PathConstr1[oehb0,tehb1]: 100 Rc[oehb0,tehb1] - Tin[oehb0,tehb1]
   + Tout[oehb0,tehb1] >= 0
 PathConstr1[tehb1,fork3]: 100 Rc[tehb1,fork3] - Tin[tehb1,fork3]
   + Tout[tehb1,fork3] >= 0
 PathConstr1[fork3,mux2]: 100 Rc[fork3,mux2] - Tin[fork3,mux2]
   + Tout[fork3,mux2] >= 0
 PathConstr1[fork3,tehb2]: 100 Rc[fork3,tehb2] - Tin[fork3,tehb2]
   + Tout[fork3,tehb2] >= 0
 PathConstr1[source0,constant4]: 100 Rc[source0,constant4]
   - Tin[source0,constant4] + Tout[source0,constant4] >= 0
 PathConstr1[constant4,extsi9]: 100 Rc[constant4,extsi9]
   - Tin[constant4,extsi9] + Tout[constant4,extsi9] >= 0
 PathConstr1[extsi9,subi1]: 100 Rc[extsi9,subi1] - Tin[extsi9,subi1]
   + Tout[extsi9,subi1] >= 0
 PathConstr1[source1,constant8]: 100 Rc[source1,constant8]
   - Tin[source1,constant8] + Tout[source1,constant8] >= 0
 PathConstr1[constant8,extsi10]: 100 Rc[constant8,extsi10]
   - Tin[constant8,extsi10] + Tout[constant8,extsi10] >= 0
 PathConstr1[extsi10,cmpi1]: 100 Rc[extsi10,cmpi1] - Tin[extsi10,cmpi1]
   + Tout[extsi10,cmpi1] >= 0
 PathConstr1[source2,constant9]: 100 Rc[source2,constant9]
   - Tin[source2,constant9] + Tout[source2,constant9] >= 0
 PathConstr1[constant9,extsi11]: 100 Rc[constant9,extsi11]
   - Tin[constant9,extsi11] + Tout[constant9,extsi11] >= 0
 PathConstr1[extsi11,addi1]: 100 Rc[extsi11,addi1] - Tin[extsi11,addi1]
   + Tout[extsi11,addi1] >= 0
 PathConstr1[mc_load0,oehb1]: 100 Rc[mc_load0,oehb1] - Tin[mc_load0,oehb1]
   + Tout[mc_load0,oehb1] >= 0
 PathConstr1[mc_load0,mem_controller0]: 100 Rc[mc_load0,mem_controller0]
   - Tin[mc_load0,mem_controller0] + Tout[mc_load0,mem_controller0] >= 0
 PathConstr1[subi1,extsi12]: 100 Rc[subi1,extsi12] - Tin[subi1,extsi12]
   + Tout[subi1,extsi12] >= 0
 PathConstr1[extsi12,oehb2]: 100 Rc[extsi12,oehb2] - Tin[extsi12,oehb2]
   + Tout[extsi12,oehb2] >= 0
 PathConstr1[oehb2,tehb3]: 100 Rc[oehb2,tehb3] - Tin[oehb2,tehb3]
   + Tout[oehb2,tehb3] >= 0
 PathConstr1[tehb3,mc_load1]: 100 Rc[tehb3,mc_load1] - Tin[tehb3,mc_load1]
   + Tout[tehb3,mc_load1] >= 0
 PathConstr1[mc_load1,muli0]: 100 Rc[mc_load1,muli0] - Tin[mc_load1,muli0]
   + Tout[mc_load1,muli0] >= 0
 PathConstr1[mc_load1,mem_controller1]: 100 Rc[mc_load1,mem_controller1]
   - Tin[mc_load1,mem_controller1] + Tout[mc_load1,mem_controller1] >= 0
 PathConstr1[oehb1,muli0]: 100 Rc[oehb1,muli0] - Tin[oehb1,muli0]
   + Tout[oehb1,muli0] >= 0
 PathConstr1[muli0,addi0]: 100 Rc[muli0,addi0] - Tin[muli0,addi0]
   + Tout[muli0,addi0] >= 0
 PathConstr1[addi0,oehb3]: 100 Rc[addi0,oehb3] - Tin[addi0,oehb3]
   + Tout[addi0,oehb3] >= 0
 PathConstr1[addi1,oehb4]: 100 Rc[addi1,oehb4] - Tin[addi1,oehb4]
   + Tout[addi1,oehb4] >= 0
 PathConstr1[oehb4,tehb4]: 100 Rc[oehb4,tehb4] - Tin[oehb4,tehb4]
   + Tout[oehb4,tehb4] >= 0
 PathConstr1[tehb4,fork4]: 100 Rc[tehb4,fork4] - Tin[tehb4,fork4]
   + Tout[tehb4,fork4] >= 0
 PathConstr1[fork4,trunci0]: 100 Rc[fork4,trunci0] - Tin[fork4,trunci0]
   + Tout[fork4,trunci0] >= 0
 PathConstr1[fork4,cmpi1]: 100 Rc[fork4,cmpi1] - Tin[fork4,cmpi1]
   + Tout[fork4,cmpi1] >= 0
 PathConstr1[trunci0,cond_br0]: 100 Rc[trunci0,cond_br0]
   - Tin[trunci0,cond_br0] + Tout[trunci0,cond_br0] >= 0
 PathConstr1[cmpi1,fork5]: 100 Rc[cmpi1,fork5] - Tin[cmpi1,fork5]
   + Tout[cmpi1,fork5] >= 0
 PathConstr1[fork5,cond_br0]: 100 Rc[fork5,cond_br0] - Tin[fork5,cond_br0]
   + Tout[fork5,cond_br0] >= 0
 PathConstr1[fork5,tehb5]: 100 Rc[fork5,tehb5] - Tin[fork5,tehb5]
   + Tout[fork5,tehb5] >= 0
 PathConstr1[fork5,cond_br3]: 100 Rc[fork5,cond_br3] - Tin[fork5,cond_br3]
   + Tout[fork5,cond_br3] >= 0
 PathConstr1[cond_br0,oehb5]: 100 Rc[cond_br0,oehb5] - Tin[cond_br0,oehb5]
   + Tout[cond_br0,oehb5] >= 0
 PathConstr1[cond_br0,sink0]: 100 Rc[cond_br0,sink0] - Tin[cond_br0,sink0]
   + Tout[cond_br0,sink0] >= 0
 PathConstr1[oehb3,cond_br2]: 100 Rc[oehb3,cond_br2] - Tin[oehb3,cond_br2]
   + Tout[oehb3,cond_br2] >= 0
 PathConstr1[tehb5,cond_br2]: 100 Rc[tehb5,cond_br2] - Tin[tehb5,cond_br2]
   + Tout[tehb5,cond_br2] >= 0
 PathConstr1[cond_br2,oehb6]: 100 Rc[cond_br2,oehb6] - Tin[cond_br2,oehb6]
   + Tout[cond_br2,oehb6] >= 0
 PathConstr1[cond_br2,return1]: 100 Rc[cond_br2,return1]
   - Tin[cond_br2,return1] + Tout[cond_br2,return1] >= 0
 PathConstr1[tehb0,cond_br3]: 100 Rc[tehb0,cond_br3] - Tin[tehb0,cond_br3]
   + Tout[tehb0,cond_br3] >= 0
 PathConstr1[cond_br3,oehb7]: 100 Rc[cond_br3,oehb7] - Tin[cond_br3,oehb7]
   + Tout[cond_br3,oehb7] >= 0
 PathConstr1[cond_br3,sink1]: 100 Rc[cond_br3,sink1] - Tin[cond_br3,sink1]
   + Tout[cond_br3,sink1] >= 0
 PathConstr1[return1,end0]: 100 Rc[return1,end0] - Tin[return1,end0]
   + Tout[return1,end0] >= 0
 PathConstr1[mem_controller0,mc_load0]: 100 Rc[mem_controller0,mc_load0]
   - Tin[mem_controller0,mc_load0] + Tout[mem_controller0,mc_load0] >= 0
 PathConstr1[mem_controller0,end0]: 100 Rc[mem_controller0,end0]
   - Tin[mem_controller0,end0] + Tout[mem_controller0,end0] >= 0
 PathConstr1[mem_controller1,mc_load1]: 100 Rc[mem_controller1,mc_load1]
   - Tin[mem_controller1,mc_load1] + Tout[mem_controller1,mc_load1] >= 0
 PathConstr1[mem_controller1,end0]: 100 Rc[mem_controller1,end0]
   - Tin[mem_controller1,end0] + Tout[mem_controller1,end0] >= 0
 PathConstr2[start_0,fork0]: Tin[start_0,fork0] <= 4
 PathConstr2[fork0,constant1]: Tin[fork0,constant1] <= 4
 PathConstr2[fork0,control_merge2]: Tin[fork0,control_merge2] <= 4
 PathConstr2[constant1,fork1]: Tin[constant1,fork1] <= 4
 PathConstr2[fork1,extsi4]: Tin[fork1,extsi4] <= 4
 PathConstr2[fork1,extsi5]: Tin[fork1,extsi5] <= 4
 PathConstr2[extsi4,mux2]: Tin[extsi4,mux2] <= 4
 PathConstr2[extsi5,mux1]: Tin[extsi5,mux1] <= 4
 PathConstr2[oehb5,tehb6]: Tin[oehb5,tehb6] <= 4
 PathConstr2[tehb6,mux2]: Tin[tehb6,mux2] <= 4
 PathConstr2[mux2,fork2]: Tin[mux2,fork2] <= 4
 PathConstr2[fork2,extsi6]: Tin[fork2,extsi6] <= 4
 PathConstr2[fork2,extsi7]: Tin[fork2,extsi7] <= 4
 PathConstr2[fork2,extsi8]: Tin[fork2,extsi8] <= 4
 PathConstr2[extsi6,addi1]: Tin[extsi6,addi1] <= 4
 PathConstr2[extsi7,subi1]: Tin[extsi7,subi1] <= 4
 PathConstr2[extsi8,mc_load0]: Tin[extsi8,mc_load0] <= 4
 PathConstr2[tehb2,mux1]: Tin[tehb2,mux1] <= 4
 PathConstr2[oehb6,tehb7]: Tin[oehb6,tehb7] <= 4
 PathConstr2[tehb7,mux1]: Tin[tehb7,mux1] <= 4
 PathConstr2[mux1,addi0]: Tin[mux1,addi0] <= 4
 PathConstr2[oehb7,control_merge2]: Tin[oehb7,control_merge2] <= 4
 PathConstr2[control_merge2,oehb0]: Tin[control_merge2,oehb0] <= 4
 PathConstr2[control_merge2,tehb0]: Tin[control_merge2,tehb0] <= 4
 PathConstr2[oehb0,tehb1]: Tin[oehb0,tehb1] <= 4
 PathConstr2[tehb1,fork3]: Tin[tehb1,fork3] <= 4
 PathConstr2[fork3,mux2]: Tin[fork3,mux2] <= 4
 PathConstr2[fork3,tehb2]: Tin[fork3,tehb2] <= 4
 PathConstr2[source0,constant4]: Tin[source0,constant4] <= 4
 PathConstr2[constant4,extsi9]: Tin[constant4,extsi9] <= 4
 PathConstr2[extsi9,subi1]: Tin[extsi9,subi1] <= 4
 PathConstr2[source1,constant8]: Tin[source1,constant8] <= 4
 PathConstr2[constant8,extsi10]: Tin[constant8,extsi10] <= 4
 PathConstr2[extsi10,cmpi1]: Tin[extsi10,cmpi1] <= 4
 PathConstr2[source2,constant9]: Tin[source2,constant9] <= 4
 PathConstr2[constant9,extsi11]: Tin[constant9,extsi11] <= 4
 PathConstr2[extsi11,addi1]: Tin[extsi11,addi1] <= 4
 PathConstr2[mc_load0,oehb1]: Tin[mc_load0,oehb1] <= 4
 PathConstr2[mc_load0,mem_controller0]: Tin[mc_load0,mem_controller0] <= 4
 PathConstr2[subi1,extsi12]: Tin[subi1,extsi12] <= 4
 PathConstr2[extsi12,oehb2]: Tin[extsi12,oehb2] <= 4
 PathConstr2[oehb2,tehb3]: Tin[oehb2,tehb3] <= 4
 PathConstr2[tehb3,mc_load1]: Tin[tehb3,mc_load1] <= 4
 PathConstr2[mc_load1,muli0]: Tin[mc_load1,muli0] <= 4
 PathConstr2[mc_load1,mem_controller1]: Tin[mc_load1,mem_controller1] <= 4
 PathConstr2[oehb1,muli0]: Tin[oehb1,muli0] <= 4
 PathConstr2[muli0,addi0]: Tin[muli0,addi0] <= 4
 PathConstr2[addi0,oehb3]: Tin[addi0,oehb3] <= 4
 PathConstr2[addi1,oehb4]: Tin[addi1,oehb4] <= 4
 PathConstr2[oehb4,tehb4]: Tin[oehb4,tehb4] <= 4
 PathConstr2[tehb4,fork4]: Tin[tehb4,fork4] <= 4
 PathConstr2[fork4,trunci0]: Tin[fork4,trunci0] <= 4
 PathConstr2[fork4,cmpi1]: Tin[fork4,cmpi1] <= 4
 PathConstr2[trunci0,cond_br0]: Tin[trunci0,cond_br0] <= 4
 PathConstr2[cmpi1,fork5]: Tin[cmpi1,fork5] <= 4
 PathConstr2[fork5,cond_br0]: Tin[fork5,cond_br0] <= 4
 PathConstr2[fork5,tehb5]: Tin[fork5,tehb5] <= 4
 PathConstr2[fork5,cond_br3]: Tin[fork5,cond_br3] <= 4
 PathConstr2[cond_br0,oehb5]: Tin[cond_br0,oehb5] <= 4
 PathConstr2[cond_br0,sink0]: Tin[cond_br0,sink0] <= 4
 PathConstr2[oehb3,cond_br2]: Tin[oehb3,cond_br2] <= 4
 PathConstr2[tehb5,cond_br2]: Tin[tehb5,cond_br2] <= 4
 PathConstr2[cond_br2,oehb6]: Tin[cond_br2,oehb6] <= 4
 PathConstr2[cond_br2,return1]: Tin[cond_br2,return1] <= 4
 PathConstr2[tehb0,cond_br3]: Tin[tehb0,cond_br3] <= 4
 PathConstr2[cond_br3,oehb7]: Tin[cond_br3,oehb7] <= 4
 PathConstr2[cond_br3,sink1]: Tin[cond_br3,sink1] <= 4
 PathConstr2[return1,end0]: Tin[return1,end0] <= 4
 PathConstr2[mem_controller0,mc_load0]: Tin[mem_controller0,mc_load0] <= 4
 PathConstr2[mem_controller0,end0]: Tin[mem_controller0,end0] <= 4
 PathConstr2[mem_controller1,mc_load1]: Tin[mem_controller1,mc_load1] <= 4
 PathConstr2[mem_controller1,end0]: Tin[mem_controller1,end0] <= 4
 PathConstr3: Tin[fork0,constant1] - Tout[start_0,fork0] >= 0
 PathConstr3: Tin[fork0,control_merge2] - Tout[start_0,fork0] >= 0
 PathConstr3: Tin[constant1,fork1] - Tout[fork0,constant1] >= 0
 PathConstr3: Tin[fork1,extsi4] - Tout[constant1,fork1] >= 0
 PathConstr3: Tin[fork1,extsi5] - Tout[constant1,fork1] >= 0
 PathConstr3: Tin[extsi4,mux2] - Tout[fork1,extsi4] >= 0
 PathConstr3: Tin[extsi5,mux1] - Tout[fork1,extsi5] >= 0
 PathConstr3: Tin[oehb5,tehb6] - Tout[cond_br0,oehb5] >= 0
 PathConstr3: Tin[tehb6,mux2] - Tout[oehb5,tehb6] >= 0
 PathConstr3: Tin[mux2,fork2] - Tout[extsi4,mux2] >= 1.412
 PathConstr3: Tin[mux2,fork2] - Tout[tehb6,mux2] >= 1.412
 PathConstr3: Tin[mux2,fork2] - Tout[fork3,mux2] >= 1.412
 PathConstr3: Tin[fork2,extsi6] - Tout[mux2,fork2] >= 0
 PathConstr3: Tin[fork2,extsi7] - Tout[mux2,fork2] >= 0
 PathConstr3: Tin[fork2,extsi8] - Tout[mux2,fork2] >= 0
 PathConstr3: Tin[extsi6,addi1] - Tout[fork2,extsi6] >= 0
 PathConstr3: Tin[extsi7,subi1] - Tout[fork2,extsi7] >= 0
 PathConstr3: Tin[extsi8,mc_load0] - Tout[fork2,extsi8] >= 0
 PathConstr3: Tin[tehb2,mux1] - Tout[fork3,tehb2] >= 0
 PathConstr3: Tin[oehb6,tehb7] - Tout[cond_br2,oehb6] >= 0
 PathConstr3: Tin[tehb7,mux1] - Tout[oehb6,tehb7] >= 0
 PathConstr3: Tin[mux1,addi0] - Tout[extsi5,mux1] >= 1.412
 PathConstr3: Tin[mux1,addi0] - Tout[tehb2,mux1] >= 1.412
 PathConstr3: Tin[mux1,addi0] - Tout[tehb7,mux1] >= 1.412
 PathConstr3: Tin[oehb7,control_merge2] - Tout[cond_br3,oehb7] >= 0
 PathConstr3: Tin[control_merge2,oehb0] - Tout[fork0,control_merge2] >= 0
 PathConstr3: Tin[control_merge2,tehb0] - Tout[fork0,control_merge2] >= 0
 PathConstr3: Tin[control_merge2,oehb0] - Tout[oehb7,control_merge2] >= 0
 PathConstr3: Tin[control_merge2,tehb0] - Tout[oehb7,control_merge2] >= 0
 PathConstr3: Tin[oehb0,tehb1] - Tout[control_merge2,oehb0] >= 0
 PathConstr3: Tin[tehb1,fork3] - Tout[oehb0,tehb1] >= 0
 PathConstr3: Tin[fork3,mux2] - Tout[tehb1,fork3] >= 0
 PathConstr3: Tin[fork3,tehb2] - Tout[tehb1,fork3] >= 0
 PathConstr3: Tin[constant4,extsi9] - Tout[source0,constant4] >= 0
 PathConstr3: Tin[extsi9,subi1] - Tout[constant4,extsi9] >= 0
 PathConstr3: Tin[constant8,extsi10] - Tout[source1,constant8] >= 0
 PathConstr3: Tin[extsi10,cmpi1] - Tout[constant8,extsi10] >= 0
 PathConstr3: Tin[constant9,extsi11] - Tout[source2,constant9] >= 0
 PathConstr3: Tin[extsi11,addi1] - Tout[constant9,extsi11] >= 0
 PathConstr3: Tin[mc_load0,oehb1] - Tout[extsi8,mc_load0] >= 1.412
 PathConstr3: Tin[mc_load0,mem_controller0] - Tout[extsi8,mc_load0]
   >= 1.412
 PathConstr3: Tin[mc_load0,oehb1] - Tout[mem_controller0,mc_load0]
   >= 1.412
 PathConstr3: Tin[mc_load0,mem_controller0]
   - Tout[mem_controller0,mc_load0] >= 1.412
 PathConstr3: Tin[subi1,extsi12] - Tout[extsi7,subi1] >= 2.047
 PathConstr3: Tin[subi1,extsi12] - Tout[extsi9,subi1] >= 2.047
 PathConstr3: Tin[extsi12,oehb2] - Tout[subi1,extsi12] >= 0
 PathConstr3: Tin[oehb2,tehb3] - Tout[extsi12,oehb2] >= 0
 PathConstr3: Tin[tehb3,mc_load1] - Tout[oehb2,tehb3] >= 0
 PathConstr3: Tin[mc_load1,muli0] - Tout[tehb3,mc_load1] >= 1.412
 PathConstr3: Tin[mc_load1,mem_controller1] - Tout[tehb3,mc_load1]
   >= 1.412
 PathConstr3: Tin[mc_load1,muli0] - Tout[mem_controller1,mc_load1]
   >= 1.412
 PathConstr3: Tin[mc_load1,mem_controller1]
   - Tout[mem_controller1,mc_load1] >= 1.412
 PathConstr3: Tin[oehb1,muli0] - Tout[mc_load0,oehb1] >= 0
 PathConstr3: Tin[muli0,addi0] - Tout[mc_load1,muli0] >= 0
 PathConstr3: Tin[muli0,addi0] - Tout[oehb1,muli0] >= 0
 PathConstr3: Tin[addi0,oehb3] - Tout[mux1,addi0] >= 2.287
 PathConstr3: Tin[addi0,oehb3] - Tout[muli0,addi0] >= 2.287
 PathConstr3: Tin[addi1,oehb4] - Tout[extsi6,addi1] >= 2.047
 PathConstr3: Tin[addi1,oehb4] - Tout[extsi11,addi1] >= 2.047
 PathConstr3: Tin[oehb4,tehb4] - Tout[addi1,oehb4] >= 0
 PathConstr3: Tin[tehb4,fork4] - Tout[oehb4,tehb4] >= 0
 PathConstr3: Tin[fork4,trunci0] - Tout[tehb4,fork4] >= 0
 PathConstr3: Tin[fork4,cmpi1] - Tout[tehb4,fork4] >= 0
 PathConstr3: Tin[trunci0,cond_br0] - Tout[fork4,trunci0] >= 0
 PathConstr3: Tin[cmpi1,fork5] - Tout[extsi10,cmpi1] >= 1.808
 PathConstr3: Tin[cmpi1,fork5] - Tout[fork4,cmpi1] >= 1.808
 PathConstr3: Tin[fork5,cond_br0] - Tout[cmpi1,fork5] >= 0
 PathConstr3: Tin[fork5,tehb5] - Tout[cmpi1,fork5] >= 0
 PathConstr3: Tin[fork5,cond_br3] - Tout[cmpi1,fork5] >= 0
 PathConstr3: Tin[cond_br0,oehb5] - Tout[trunci0,cond_br0] >= 0
 PathConstr3: Tin[cond_br0,sink0] - Tout[trunci0,cond_br0] >= 0
 PathConstr3: Tin[cond_br0,oehb5] - Tout[fork5,cond_br0] >= 0
 PathConstr3: Tin[cond_br0,sink0] - Tout[fork5,cond_br0] >= 0
 PathConstr3: Tin[oehb3,cond_br2] - Tout[addi0,oehb3] >= 0
 PathConstr3: Tin[tehb5,cond_br2] - Tout[fork5,tehb5] >= 0
 PathConstr3: Tin[cond_br2,oehb6] - Tout[oehb3,cond_br2] >= 0
 PathConstr3: Tin[cond_br2,return1] - Tout[oehb3,cond_br2] >= 0
 PathConstr3: Tin[cond_br2,oehb6] - Tout[tehb5,cond_br2] >= 0
 PathConstr3: Tin[cond_br2,return1] - Tout[tehb5,cond_br2] >= 0
 PathConstr3: Tin[tehb0,cond_br3] - Tout[control_merge2,tehb0] >= 0
 PathConstr3: Tin[cond_br3,oehb7] - Tout[fork5,cond_br3] >= 0
 PathConstr3: Tin[cond_br3,sink1] - Tout[fork5,cond_br3] >= 0
 PathConstr3: Tin[cond_br3,oehb7] - Tout[tehb0,cond_br3] >= 0
 PathConstr3: Tin[cond_br3,sink1] - Tout[tehb0,cond_br3] >= 0
 PathConstr3: Tin[return1,end0] - Tout[cond_br2,return1] >= 1.412
 PathConstr3: Tin[mem_controller0,mc_load0]
   - Tout[mc_load0,mem_controller0] >= 0
 PathConstr3: Tin[mem_controller0,end0] - Tout[mc_load0,mem_controller0]
   >= 0
 PathConstr3: Tin[mem_controller1,mc_load1]
   - Tout[mc_load1,mem_controller1] >= 0
 PathConstr3: Tin[mem_controller1,end0] - Tout[mc_load1,mem_controller1]
   >= 0
 ThroughputConstr1[start_0,fork0]: Theta_1[start_0,fork0] + ru[start_0]
   - ru[fork0] = 0
 ThroughputConstr1[fork0,constant1]: Theta_1[fork0,constant1] + ru[fork0]
   - ru[constant1] = 0
 ThroughputConstr1[fork0,control_merge2]: Theta_1[fork0,control_merge2]
   + ru[fork0] - ru[control_merge2] = 0
 ThroughputConstr1[constant1,fork1]: Theta_1[constant1,fork1]
   + ru[constant1] - ru[fork1] = 0
 ThroughputConstr1[fork1,extsi4]: Theta_1[fork1,extsi4] + ru[fork1]
   - ru[extsi4] = 0
 ThroughputConstr1[fork1,extsi5]: Theta_1[fork1,extsi5] + ru[fork1]
   - ru[extsi5] = 0
 ThroughputConstr1[extsi4,mux2]: Theta_1[extsi4,mux2] + ru[extsi4]
   - ru[mux2] = 0
 ThroughputConstr1[extsi5,mux1]: Theta_1[extsi5,mux1] + ru[extsi5]
   - ru[mux1] = 0
 ThroughputConstr1[oehb5,tehb6]: Theta_1[oehb5,tehb6] + ru[oehb5]
   - ru[tehb6] = 0
 ThroughputConstr1[tehb6,mux2]: Theta_1[tehb6,mux2] + ru[tehb6] - ru[mux2]
   = 0
 ThroughputConstr1[mux2,fork2]: Theta_1[mux2,fork2] + ru[mux2] - ru[fork2]
   = 0
 ThroughputConstr1[fork2,extsi6]: Theta_1[fork2,extsi6] + ru[fork2]
   - ru[extsi6] = 0
 ThroughputConstr1[fork2,extsi7]: Theta_1[fork2,extsi7] + ru[fork2]
   - ru[extsi7] = 0
 ThroughputConstr1[fork2,extsi8]: Theta_1[fork2,extsi8] + ru[fork2]
   - ru[extsi8] = 0
 ThroughputConstr1[extsi6,addi1]: Theta_1[extsi6,addi1] + ru[extsi6]
   - ru[addi1] = 0
 ThroughputConstr1[extsi7,subi1]: Theta_1[extsi7,subi1] + ru[extsi7]
   - ru[subi1] = 0
 ThroughputConstr1[extsi8,mc_load0]: Theta_1[extsi8,mc_load0] + ru[extsi8]
   - ru[mc_load0] = 0
 ThroughputConstr1[tehb2,mux1]: Theta_1[tehb2,mux1] + ru[tehb2] - ru[mux1]
   = 0
 ThroughputConstr1[oehb6,tehb7]: Theta_1[oehb6,tehb7] + ru[oehb6]
   - ru[tehb7] = 0
 ThroughputConstr1[tehb7,mux1]: Theta_1[tehb7,mux1] + ru[tehb7] - ru[mux1]
   = 0
 ThroughputConstr1[mux1,addi0]: Theta_1[mux1,addi0] + ru[mux1] - ru[addi0]
   = 0
 ThroughputConstr1[oehb7,control_merge2]: Theta_1[oehb7,control_merge2]
   + ru[oehb7] - ru[control_merge2] = 0
 ThroughputConstr1[control_merge2,oehb0]: Theta_1[control_merge2,oehb0]
   + ru[control_merge2] - ru[oehb0] = 0
 ThroughputConstr1[control_merge2,tehb0]: Theta_1[control_merge2,tehb0]
   + ru[control_merge2] - ru[tehb0] = 0
 ThroughputConstr1[oehb0,tehb1]: Theta_1[oehb0,tehb1] + ru[oehb0]
   - ru[tehb1] = 0
 ThroughputConstr1[tehb1,fork3]: Theta_1[tehb1,fork3] + ru[tehb1]
   - ru[fork3] = 0
 ThroughputConstr1[fork3,mux2]: Theta_1[fork3,mux2] - ru[mux2] + ru[fork3]
   = 1
 ThroughputConstr1[fork3,tehb2]: Theta_1[fork3,tehb2] - ru[tehb2]
   + ru[fork3] = 0
 ThroughputConstr1[source0,constant4]: Theta_1[source0,constant4]
   + ru[source0] - ru[constant4] = 0
 ThroughputConstr1[constant4,extsi9]: Theta_1[constant4,extsi9]
   + ru[constant4] - ru[extsi9] = 0
 ThroughputConstr1[extsi9,subi1]: Theta_1[extsi9,subi1] + ru[extsi9]
   - ru[subi1] = 0
 ThroughputConstr1[source1,constant8]: Theta_1[source1,constant8]
   + ru[source1] - ru[constant8] = 0
 ThroughputConstr1[constant8,extsi10]: Theta_1[constant8,extsi10]
   + ru[constant8] - ru[extsi10] = 0
 ThroughputConstr1[extsi10,cmpi1]: Theta_1[extsi10,cmpi1] + ru[extsi10]
   - ru[cmpi1] = 0
 ThroughputConstr1[source2,constant9]: Theta_1[source2,constant9]
   + ru[source2] - ru[constant9] = 0
 ThroughputConstr1[constant9,extsi11]: Theta_1[constant9,extsi11]
   + ru[constant9] - ru[extsi11] = 0
 ThroughputConstr1[extsi11,addi1]: Theta_1[extsi11,addi1] + ru[extsi11]
   - ru[addi1] = 0
 ThroughputConstr1[mc_load0,oehb1]: Theta_1[mc_load0,oehb1] + ru[mc_load0]
   - ru[oehb1] = 0
 ThroughputConstr1[mc_load0,mem_controller0]:
   Theta_1[mc_load0,mem_controller0] + ru[mc_load0] - ru[mem_controller0]
   = 0
 ThroughputConstr1[subi1,extsi12]: Theta_1[subi1,extsi12] + ru[subi1]
   - ru[extsi12] = 0
 ThroughputConstr1[extsi12,oehb2]: Theta_1[extsi12,oehb2] + ru[extsi12]
   - ru[oehb2] = 0
 ThroughputConstr1[oehb2,tehb3]: Theta_1[oehb2,tehb3] + ru[oehb2]
   - ru[tehb3] = 0
 ThroughputConstr1[tehb3,mc_load1]: Theta_1[tehb3,mc_load1] + ru[tehb3]
   - ru[mc_load1] = 0
 ThroughputConstr1[mc_load1,muli0]: Theta_1[mc_load1,muli0] + ru[mc_load1]
   - ru[muli0] = 0
 ThroughputConstr1[mc_load1,mem_controller1]:
   Theta_1[mc_load1,mem_controller1] + ru[mc_load1] - ru[mem_controller1]
   = 0
 ThroughputConstr1[oehb1,muli0]: Theta_1[oehb1,muli0] + ru[oehb1]
   - ru[muli0] = 0
 ThroughputConstr1[muli0,addi0]: Theta_1[muli0,addi0] + ru[muli0]
   - ru[addi0] = 0
 ThroughputConstr1[addi0,oehb3]: Theta_1[addi0,oehb3] + ru[addi0]
   - ru[oehb3] = 0
 ThroughputConstr1[addi1,oehb4]: Theta_1[addi1,oehb4] + ru[addi1]
   - ru[oehb4] = 0
 ThroughputConstr1[oehb4,tehb4]: Theta_1[oehb4,tehb4] + ru[oehb4]
   - ru[tehb4] = 0
 ThroughputConstr1[tehb4,fork4]: Theta_1[tehb4,fork4] + ru[tehb4]
   - ru[fork4] = 0
 ThroughputConstr1[fork4,trunci0]: Theta_1[fork4,trunci0] + ru[fork4]
   - ru[trunci0] = 0
 ThroughputConstr1[fork4,cmpi1]: Theta_1[fork4,cmpi1] + ru[fork4]
   - ru[cmpi1] = 0
 ThroughputConstr1[trunci0,cond_br0]: Theta_1[trunci0,cond_br0]
   + ru[trunci0] - ru[cond_br0] = 0
 ThroughputConstr1[cmpi1,fork5]: Theta_1[cmpi1,fork5] + ru[cmpi1]
   - ru[fork5] = 0
 ThroughputConstr1[fork5,cond_br0]: Theta_1[fork5,cond_br0] + ru[fork5]
   - ru[cond_br0] = 0
 ThroughputConstr1[fork5,tehb5]: Theta_1[fork5,tehb5] + ru[fork5]
   - ru[tehb5] = 0
 ThroughputConstr1[fork5,cond_br3]: Theta_1[fork5,cond_br3] + ru[fork5]
   - ru[cond_br3] = 0
 ThroughputConstr1[cond_br0,oehb5]: Theta_1[cond_br0,oehb5] - ru[oehb5]
   + ru[cond_br0] = 0
 ThroughputConstr1[cond_br0,sink0]: Theta_1[cond_br0,sink0] + ru[cond_br0]
   - ru[sink0] = 0
 ThroughputConstr1[oehb3,cond_br2]: Theta_1[oehb3,cond_br2] + ru[oehb3]
   - ru[cond_br2] = 0
 ThroughputConstr1[tehb5,cond_br2]: Theta_1[tehb5,cond_br2] + ru[tehb5]
   - ru[cond_br2] = 0
 ThroughputConstr1[cond_br2,oehb6]: Theta_1[cond_br2,oehb6] - ru[oehb6]
   + ru[cond_br2] = 0
 ThroughputConstr1[cond_br2,return1]: Theta_1[cond_br2,return1]
   + ru[cond_br2] - ru[return1] = 0
 ThroughputConstr1[tehb0,cond_br3]: Theta_1[tehb0,cond_br3] + ru[tehb0]
   - ru[cond_br3] = 0
 ThroughputConstr1[cond_br3,oehb7]: Theta_1[cond_br3,oehb7] - ru[oehb7]
   + ru[cond_br3] = 0
 ThroughputConstr1[cond_br3,sink1]: Theta_1[cond_br3,sink1] + ru[cond_br3]
   - ru[sink1] = 0
 ThroughputConstr1[return1,end0]: Theta_1[return1,end0] + ru[return1]
   - ru[end0] = 0
 ThroughputConstr1[mem_controller0,mc_load0]:
   Theta_1[mem_controller0,mc_load0] - ru[mc_load0] + ru[mem_controller0]
   = 0
 ThroughputConstr1[mem_controller0,end0]: Theta_1[mem_controller0,end0]
   - ru[end0] + ru[mem_controller0] = 0
 ThroughputConstr1[mem_controller1,mc_load1]:
   Theta_1[mem_controller1,mc_load1] - ru[mc_load1] + ru[mem_controller1]
   = 0
 ThroughputConstr1[mem_controller1,end0]: Theta_1[mem_controller1,end0]
   - ru[end0] + ru[mem_controller1] = 0
 ThroughputConstr2: Rc[oehb5,tehb6] + Theta[0] - Theta_1[oehb5,tehb6] <= 1
 ThroughputConstr2: Rc[tehb6,mux2] + Theta[0] - Theta_1[tehb6,mux2] <= 1
 ThroughputConstr2: Rc[mux2,fork2] + Theta[0] - Theta_1[mux2,fork2] <= 1
 ThroughputConstr2: Rc[fork2,extsi6] + Theta[0] - Theta_1[fork2,extsi6]
   <= 1
 ThroughputConstr2: Rc[fork2,extsi7] + Theta[0] - Theta_1[fork2,extsi7]
   <= 1
 ThroughputConstr2: Rc[fork2,extsi8] + Theta[0] - Theta_1[fork2,extsi8]
   <= 1
 ThroughputConstr2: Rc[extsi6,addi1] + Theta[0] - Theta_1[extsi6,addi1]
   <= 1
 ThroughputConstr2: Rc[extsi7,subi1] + Theta[0] - Theta_1[extsi7,subi1]
   <= 1
 ThroughputConstr2: Rc[extsi8,mc_load0] + Theta[0]
   - Theta_1[extsi8,mc_load0] <= 1
 ThroughputConstr2: Rc[tehb2,mux1] + Theta[0] - Theta_1[tehb2,mux1] <= 1
 ThroughputConstr2: Rc[oehb6,tehb7] + Theta[0] - Theta_1[oehb6,tehb7] <= 1
 ThroughputConstr2: Rc[tehb7,mux1] + Theta[0] - Theta_1[tehb7,mux1] <= 1
 ThroughputConstr2: Rc[mux1,addi0] + Theta[0] - Theta_1[mux1,addi0] <= 1
 ThroughputConstr2: Rc[oehb7,control_merge2] + Theta[0]
   - Theta_1[oehb7,control_merge2] <= 1
 ThroughputConstr2: Rc[control_merge2,oehb0] + Theta[0]
   - Theta_1[control_merge2,oehb0] <= 1
 ThroughputConstr2: Rc[control_merge2,tehb0] + Theta[0]
   - Theta_1[control_merge2,tehb0] <= 1
 ThroughputConstr2: Rc[oehb0,tehb1] + Theta[0] - Theta_1[oehb0,tehb1] <= 1
 ThroughputConstr2: Rc[tehb1,fork3] + Theta[0] - Theta_1[tehb1,fork3] <= 1
 ThroughputConstr2: Rc[fork3,mux2] + Theta[0] - Theta_1[fork3,mux2] <= 1
 ThroughputConstr2: Rc[fork3,tehb2] + Theta[0] - Theta_1[fork3,tehb2] <= 1
 ThroughputConstr2: Rc[source0,constant4] + Theta[0]
   - Theta_1[source0,constant4] <= 1
 ThroughputConstr2: Rc[constant4,extsi9] + Theta[0]
   - Theta_1[constant4,extsi9] <= 1
 ThroughputConstr2: Rc[extsi9,subi1] + Theta[0] - Theta_1[extsi9,subi1]
   <= 1
 ThroughputConstr2: Rc[source1,constant8] + Theta[0]
   - Theta_1[source1,constant8] <= 1
 ThroughputConstr2: Rc[constant8,extsi10] + Theta[0]
   - Theta_1[constant8,extsi10] <= 1
 ThroughputConstr2: Rc[extsi10,cmpi1] + Theta[0] - Theta_1[extsi10,cmpi1]
   <= 1
 ThroughputConstr2: Rc[source2,constant9] + Theta[0]
   - Theta_1[source2,constant9] <= 1
 ThroughputConstr2: Rc[constant9,extsi11] + Theta[0]
   - Theta_1[constant9,extsi11] <= 1
 ThroughputConstr2: Rc[extsi11,addi1] + Theta[0] - Theta_1[extsi11,addi1]
   <= 1
 ThroughputConstr2: Rc[mc_load0,oehb1] + Theta[0] - Theta_1[mc_load0,oehb1]
   <= 1
 ThroughputConstr2: Rc[subi1,extsi12] + Theta[0] - Theta_1[subi1,extsi12]
   <= 1
 ThroughputConstr2: Rc[extsi12,oehb2] + Theta[0] - Theta_1[extsi12,oehb2]
   <= 1
 ThroughputConstr2: Rc[oehb2,tehb3] + Theta[0] - Theta_1[oehb2,tehb3] <= 1
 ThroughputConstr2: Rc[tehb3,mc_load1] + Theta[0] - Theta_1[tehb3,mc_load1]
   <= 1
 ThroughputConstr2: Rc[mc_load1,muli0] + Theta[0] - Theta_1[mc_load1,muli0]
   <= 1
 ThroughputConstr2: Rc[oehb1,muli0] + Theta[0] - Theta_1[oehb1,muli0] <= 1
 ThroughputConstr2: Rc[muli0,addi0] + Theta[0] - Theta_1[muli0,addi0] <= 1
 ThroughputConstr2: Rc[addi0,oehb3] + Theta[0] - Theta_1[addi0,oehb3] <= 1
 ThroughputConstr2: Rc[addi1,oehb4] + Theta[0] - Theta_1[addi1,oehb4] <= 1
 ThroughputConstr2: Rc[oehb4,tehb4] + Theta[0] - Theta_1[oehb4,tehb4] <= 1
 ThroughputConstr2: Rc[tehb4,fork4] + Theta[0] - Theta_1[tehb4,fork4] <= 1
 ThroughputConstr2: Rc[fork4,trunci0] + Theta[0] - Theta_1[fork4,trunci0]
   <= 1
 ThroughputConstr2: Rc[fork4,cmpi1] + Theta[0] - Theta_1[fork4,cmpi1] <= 1
 ThroughputConstr2: Rc[trunci0,cond_br0] + Theta[0]
   - Theta_1[trunci0,cond_br0] <= 1
 ThroughputConstr2: Rc[cmpi1,fork5] + Theta[0] - Theta_1[cmpi1,fork5] <= 1
 ThroughputConstr2: Rc[fork5,cond_br0] + Theta[0] - Theta_1[fork5,cond_br0]
   <= 1
 ThroughputConstr2: Rc[fork5,tehb5] + Theta[0] - Theta_1[fork5,tehb5] <= 1
 ThroughputConstr2: Rc[fork5,cond_br3] + Theta[0] - Theta_1[fork5,cond_br3]
   <= 1
 ThroughputConstr2: Rc[cond_br0,oehb5] + Theta[0] - Theta_1[cond_br0,oehb5]
   <= 1
 ThroughputConstr2: Rc[oehb3,cond_br2] + Theta[0] - Theta_1[oehb3,cond_br2]
   <= 1
 ThroughputConstr2: Rc[tehb5,cond_br2] + Theta[0] - Theta_1[tehb5,cond_br2]
   <= 1
 ThroughputConstr2: Rc[cond_br2,oehb6] + Theta[0] - Theta_1[cond_br2,oehb6]
   <= 1
 ThroughputConstr2: Rc[tehb0,cond_br3] + Theta[0] - Theta_1[tehb0,cond_br3]
   <= 1
 ThroughputConstr2: Rc[cond_br3,oehb7] + Theta[0] - Theta_1[cond_br3,oehb7]
   <= 1
 SizingConstr1[start_0,fork0]: Nc[start_0,fork0] - Theta_1[start_0,fork0]
   - Theta_0[start_0,fork0] = 0
 SizingConstr1[fork0,constant1]: Nc[fork0,constant1]
   - Theta_1[fork0,constant1] - Theta_0[fork0,constant1] = 0
 SizingConstr1[fork0,control_merge2]: Nc[fork0,control_merge2]
   - Theta_1[fork0,control_merge2] - Theta_0[fork0,control_merge2] = 0
 SizingConstr1[constant1,fork1]: Nc[constant1,fork1]
   - Theta_1[constant1,fork1] - Theta_0[constant1,fork1] = 0
 SizingConstr1[fork1,extsi4]: Nc[fork1,extsi4] - Theta_1[fork1,extsi4]
   - Theta_0[fork1,extsi4] = 0
 SizingConstr1[fork1,extsi5]: Nc[fork1,extsi5] - Theta_1[fork1,extsi5]
   - Theta_0[fork1,extsi5] = 0
 SizingConstr1[extsi4,mux2]: Nc[extsi4,mux2] - Theta_1[extsi4,mux2]
   - Theta_0[extsi4,mux2] = 0
 SizingConstr1[extsi5,mux1]: Nc[extsi5,mux1] - Theta_1[extsi5,mux1]
   - Theta_0[extsi5,mux1] = 0
 SizingConstr1[oehb5,tehb6]: Nc[oehb5,tehb6] - Theta_1[oehb5,tehb6]
   - Theta_0[oehb5,tehb6] = 0
 SizingConstr1[tehb6,mux2]: Nc[tehb6,mux2] - Theta_1[tehb6,mux2]
   - Theta_0[tehb6,mux2] = 0
 SizingConstr1[mux2,fork2]: Nc[mux2,fork2] - Theta_1[mux2,fork2]
   - Theta_0[mux2,fork2] = 0
 SizingConstr1[fork2,extsi6]: Nc[fork2,extsi6] - Theta_1[fork2,extsi6]
   - Theta_0[fork2,extsi6] = 0
 SizingConstr1[fork2,extsi7]: Nc[fork2,extsi7] - Theta_1[fork2,extsi7]
   - Theta_0[fork2,extsi7] = 0
 SizingConstr1[fork2,extsi8]: Nc[fork2,extsi8] - Theta_1[fork2,extsi8]
   - Theta_0[fork2,extsi8] = 0
 SizingConstr1[extsi6,addi1]: Nc[extsi6,addi1] - Theta_1[extsi6,addi1]
   - Theta_0[extsi6,addi1] = 0
 SizingConstr1[extsi7,subi1]: Nc[extsi7,subi1] - Theta_1[extsi7,subi1]
   - Theta_0[extsi7,subi1] = 0
 SizingConstr1[extsi8,mc_load0]: Nc[extsi8,mc_load0]
   - Theta_1[extsi8,mc_load0] - Theta_0[extsi8,mc_load0] = 0
 SizingConstr1[tehb2,mux1]: Nc[tehb2,mux1] - Theta_1[tehb2,mux1]
   - Theta_0[tehb2,mux1] = 0
 SizingConstr1[oehb6,tehb7]: Nc[oehb6,tehb7] - Theta_1[oehb6,tehb7]
   - Theta_0[oehb6,tehb7] = 0
 SizingConstr1[tehb7,mux1]: Nc[tehb7,mux1] - Theta_1[tehb7,mux1]
   - Theta_0[tehb7,mux1] = 0
 SizingConstr1[mux1,addi0]: Nc[mux1,addi0] - Theta_1[mux1,addi0]
   - Theta_0[mux1,addi0] = 0
 SizingConstr1[oehb7,control_merge2]: Nc[oehb7,control_merge2]
   - Theta_1[oehb7,control_merge2] - Theta_0[oehb7,control_merge2] = 0
 SizingConstr1[control_merge2,oehb0]: Nc[control_merge2,oehb0]
   - Theta_1[control_merge2,oehb0] - Theta_0[control_merge2,oehb0] = 0
 SizingConstr1[control_merge2,tehb0]: Nc[control_merge2,tehb0]
   - Theta_1[control_merge2,tehb0] - Theta_0[control_merge2,tehb0] = 0
 SizingConstr1[oehb0,tehb1]: Nc[oehb0,tehb1] - Theta_1[oehb0,tehb1]
   - Theta_0[oehb0,tehb1] = 0
 SizingConstr1[tehb1,fork3]: Nc[tehb1,fork3] - Theta_1[tehb1,fork3]
   - Theta_0[tehb1,fork3] = 0
 SizingConstr1[fork3,mux2]: Nc[fork3,mux2] - Theta_1[fork3,mux2]
   - Theta_0[fork3,mux2] = 0
 SizingConstr1[fork3,tehb2]: Nc[fork3,tehb2] - Theta_1[fork3,tehb2]
   - Theta_0[fork3,tehb2] = 0
 SizingConstr1[source0,constant4]: Nc[source0,constant4]
   - Theta_1[source0,constant4] - Theta_0[source0,constant4] = 0
 SizingConstr1[constant4,extsi9]: Nc[constant4,extsi9]
   - Theta_1[constant4,extsi9] - Theta_0[constant4,extsi9] = 0
 SizingConstr1[extsi9,subi1]: Nc[extsi9,subi1] - Theta_1[extsi9,subi1]
   - Theta_0[extsi9,subi1] = 0
 SizingConstr1[source1,constant8]: Nc[source1,constant8]
   - Theta_1[source1,constant8] - Theta_0[source1,constant8] = 0
 SizingConstr1[constant8,extsi10]: Nc[constant8,extsi10]
   - Theta_1[constant8,extsi10] - Theta_0[constant8,extsi10] = 0
 SizingConstr1[extsi10,cmpi1]: Nc[extsi10,cmpi1] - Theta_1[extsi10,cmpi1]
   - Theta_0[extsi10,cmpi1] = 0
 SizingConstr1[source2,constant9]: Nc[source2,constant9]
   - Theta_1[source2,constant9] - Theta_0[source2,constant9] = 0
 SizingConstr1[constant9,extsi11]: Nc[constant9,extsi11]
   - Theta_1[constant9,extsi11] - Theta_0[constant9,extsi11] = 0
 SizingConstr1[extsi11,addi1]: Nc[extsi11,addi1] - Theta_1[extsi11,addi1]
   - Theta_0[extsi11,addi1] = 0
 SizingConstr1[mc_load0,oehb1]: Nc[mc_load0,oehb1]
   - Theta_1[mc_load0,oehb1] - Theta_0[mc_load0,oehb1] = 0
 SizingConstr1[mc_load0,mem_controller0]: Nc[mc_load0,mem_controller0]
   - Theta_1[mc_load0,mem_controller0] - Theta_0[mc_load0,mem_controller0]
   = 0
 SizingConstr1[subi1,extsi12]: Nc[subi1,extsi12] - Theta_1[subi1,extsi12]
   - Theta_0[subi1,extsi12] = 0
 SizingConstr1[extsi12,oehb2]: Nc[extsi12,oehb2] - Theta_1[extsi12,oehb2]
   - Theta_0[extsi12,oehb2] = 0
 SizingConstr1[oehb2,tehb3]: Nc[oehb2,tehb3] - Theta_1[oehb2,tehb3]
   - Theta_0[oehb2,tehb3] = 0
 SizingConstr1[tehb3,mc_load1]: Nc[tehb3,mc_load1]
   - Theta_1[tehb3,mc_load1] - Theta_0[tehb3,mc_load1] = 0
 SizingConstr1[mc_load1,muli0]: Nc[mc_load1,muli0]
   - Theta_1[mc_load1,muli0] - Theta_0[mc_load1,muli0] = 0
 SizingConstr1[mc_load1,mem_controller1]: Nc[mc_load1,mem_controller1]
   - Theta_1[mc_load1,mem_controller1] - Theta_0[mc_load1,mem_controller1]
   = 0
 SizingConstr1[oehb1,muli0]: Nc[oehb1,muli0] - Theta_1[oehb1,muli0]
   - Theta_0[oehb1,muli0] = 0
 SizingConstr1[muli0,addi0]: Nc[muli0,addi0] - Theta_1[muli0,addi0]
   - Theta_0[muli0,addi0] = 0
 SizingConstr1[addi0,oehb3]: Nc[addi0,oehb3] - Theta_1[addi0,oehb3]
   - Theta_0[addi0,oehb3] = 0
 SizingConstr1[addi1,oehb4]: Nc[addi1,oehb4] - Theta_1[addi1,oehb4]
   - Theta_0[addi1,oehb4] = 0
 SizingConstr1[oehb4,tehb4]: Nc[oehb4,tehb4] - Theta_1[oehb4,tehb4]
   - Theta_0[oehb4,tehb4] = 0
 SizingConstr1[tehb4,fork4]: Nc[tehb4,fork4] - Theta_1[tehb4,fork4]
   - Theta_0[tehb4,fork4] = 0
 SizingConstr1[fork4,trunci0]: Nc[fork4,trunci0] - Theta_1[fork4,trunci0]
   - Theta_0[fork4,trunci0] = 0
 SizingConstr1[fork4,cmpi1]: Nc[fork4,cmpi1] - Theta_1[fork4,cmpi1]
   - Theta_0[fork4,cmpi1] = 0
 SizingConstr1[trunci0,cond_br0]: Nc[trunci0,cond_br0]
   - Theta_1[trunci0,cond_br0] - Theta_0[trunci0,cond_br0] = 0
 SizingConstr1[cmpi1,fork5]: Nc[cmpi1,fork5] - Theta_1[cmpi1,fork5]
   - Theta_0[cmpi1,fork5] = 0
 SizingConstr1[fork5,cond_br0]: Nc[fork5,cond_br0]
   - Theta_1[fork5,cond_br0] - Theta_0[fork5,cond_br0] = 0
 SizingConstr1[fork5,tehb5]: Nc[fork5,tehb5] - Theta_1[fork5,tehb5]
   - Theta_0[fork5,tehb5] = 0
 SizingConstr1[fork5,cond_br3]: Nc[fork5,cond_br3]
   - Theta_1[fork5,cond_br3] - Theta_0[fork5,cond_br3] = 0
 SizingConstr1[cond_br0,oehb5]: Nc[cond_br0,oehb5]
   - Theta_1[cond_br0,oehb5] - Theta_0[cond_br0,oehb5] = 0
 SizingConstr1[cond_br0,sink0]: Nc[cond_br0,sink0]
   - Theta_1[cond_br0,sink0] - Theta_0[cond_br0,sink0] = 0
 SizingConstr1[oehb3,cond_br2]: Nc[oehb3,cond_br2]
   - Theta_1[oehb3,cond_br2] - Theta_0[oehb3,cond_br2] = 0
 SizingConstr1[tehb5,cond_br2]: Nc[tehb5,cond_br2]
   - Theta_1[tehb5,cond_br2] - Theta_0[tehb5,cond_br2] = 0
 SizingConstr1[cond_br2,oehb6]: Nc[cond_br2,oehb6]
   - Theta_1[cond_br2,oehb6] - Theta_0[cond_br2,oehb6] = 0
 SizingConstr1[cond_br2,return1]: Nc[cond_br2,return1]
   - Theta_1[cond_br2,return1] - Theta_0[cond_br2,return1] = 0
 SizingConstr1[tehb0,cond_br3]: Nc[tehb0,cond_br3]
   - Theta_1[tehb0,cond_br3] - Theta_0[tehb0,cond_br3] = 0
 SizingConstr1[cond_br3,oehb7]: Nc[cond_br3,oehb7]
   - Theta_1[cond_br3,oehb7] - Theta_0[cond_br3,oehb7] = 0
 SizingConstr1[cond_br3,sink1]: Nc[cond_br3,sink1]
   - Theta_1[cond_br3,sink1] - Theta_0[cond_br3,sink1] = 0
 SizingConstr1[return1,end0]: Nc[return1,end0] - Theta_1[return1,end0]
   - Theta_0[return1,end0] = 0
 SizingConstr1[mem_controller0,mc_load0]: Nc[mem_controller0,mc_load0]
   - Theta_1[mem_controller0,mc_load0] - Theta_0[mem_controller0,mc_load0]
   = 0
 SizingConstr1[mem_controller0,end0]: Nc[mem_controller0,end0]
   - Theta_1[mem_controller0,end0] - Theta_0[mem_controller0,end0] = 0
 SizingConstr1[mem_controller1,mc_load1]: Nc[mem_controller1,mc_load1]
   - Theta_1[mem_controller1,mc_load1] - Theta_0[mem_controller1,mc_load1]
   = 0
 SizingConstr1[mem_controller1,end0]: Nc[mem_controller1,end0]
   - Theta_1[mem_controller1,end0] - Theta_0[mem_controller1,end0] = 0
 SizingConstr2: Rc[oehb5,tehb6] + Theta[0] - Theta_0[oehb5,tehb6] <= 1
 SizingConstr2: Rc[tehb6,mux2] + Theta[0] - Theta_0[tehb6,mux2] <= 1
 SizingConstr2: Rc[mux2,fork2] + Theta[0] - Theta_0[mux2,fork2] <= 1
 SizingConstr2: Rc[fork2,extsi6] + Theta[0] - Theta_0[fork2,extsi6] <= 1
 SizingConstr2: Rc[fork2,extsi7] + Theta[0] - Theta_0[fork2,extsi7] <= 1
 SizingConstr2: Rc[fork2,extsi8] + Theta[0] - Theta_0[fork2,extsi8] <= 1
 SizingConstr2: Rc[extsi6,addi1] + Theta[0] - Theta_0[extsi6,addi1] <= 1
 SizingConstr2: Rc[extsi7,subi1] + Theta[0] - Theta_0[extsi7,subi1] <= 1
 SizingConstr2: Rc[extsi8,mc_load0] + Theta[0] - Theta_0[extsi8,mc_load0]
   <= 1
 SizingConstr2: Rc[tehb2,mux1] + Theta[0] - Theta_0[tehb2,mux1] <= 1
 SizingConstr2: Rc[oehb6,tehb7] + Theta[0] - Theta_0[oehb6,tehb7] <= 1
 SizingConstr2: Rc[tehb7,mux1] + Theta[0] - Theta_0[tehb7,mux1] <= 1
 SizingConstr2: Rc[mux1,addi0] + Theta[0] - Theta_0[mux1,addi0] <= 1
 SizingConstr2: Rc[oehb7,control_merge2] + Theta[0]
   - Theta_0[oehb7,control_merge2] <= 1
 SizingConstr2: Rc[control_merge2,oehb0] + Theta[0]
   - Theta_0[control_merge2,oehb0] <= 1
 SizingConstr2: Rc[control_merge2,tehb0] + Theta[0]
   - Theta_0[control_merge2,tehb0] <= 1
 SizingConstr2: Rc[oehb0,tehb1] + Theta[0] - Theta_0[oehb0,tehb1] <= 1
 SizingConstr2: Rc[tehb1,fork3] + Theta[0] - Theta_0[tehb1,fork3] <= 1
 SizingConstr2: Rc[fork3,mux2] + Theta[0] - Theta_0[fork3,mux2] <= 1
 SizingConstr2: Rc[fork3,tehb2] + Theta[0] - Theta_0[fork3,tehb2] <= 1
 SizingConstr2: Rc[source0,constant4] + Theta[0]
   - Theta_0[source0,constant4] <= 1
 SizingConstr2: Rc[constant4,extsi9] + Theta[0] - Theta_0[constant4,extsi9]
   <= 1
 SizingConstr2: Rc[extsi9,subi1] + Theta[0] - Theta_0[extsi9,subi1] <= 1
 SizingConstr2: Rc[source1,constant8] + Theta[0]
   - Theta_0[source1,constant8] <= 1
 SizingConstr2: Rc[constant8,extsi10] + Theta[0]
   - Theta_0[constant8,extsi10] <= 1
 SizingConstr2: Rc[extsi10,cmpi1] + Theta[0] - Theta_0[extsi10,cmpi1] <= 1
 SizingConstr2: Rc[source2,constant9] + Theta[0]
   - Theta_0[source2,constant9] <= 1
 SizingConstr2: Rc[constant9,extsi11] + Theta[0]
   - Theta_0[constant9,extsi11] <= 1
 SizingConstr2: Rc[extsi11,addi1] + Theta[0] - Theta_0[extsi11,addi1] <= 1
 SizingConstr2: Rc[mc_load0,oehb1] + Theta[0] - Theta_0[mc_load0,oehb1]
   <= 1
 SizingConstr2: Rc[subi1,extsi12] + Theta[0] - Theta_0[subi1,extsi12] <= 1
 SizingConstr2: Rc[extsi12,oehb2] + Theta[0] - Theta_0[extsi12,oehb2] <= 1
 SizingConstr2: Rc[oehb2,tehb3] + Theta[0] - Theta_0[oehb2,tehb3] <= 1
 SizingConstr2: Rc[tehb3,mc_load1] + Theta[0] - Theta_0[tehb3,mc_load1]
   <= 1
 SizingConstr2: Rc[mc_load1,muli0] + Theta[0] - Theta_0[mc_load1,muli0]
   <= 1
 SizingConstr2: Rc[oehb1,muli0] + Theta[0] - Theta_0[oehb1,muli0] <= 1
 SizingConstr2: Rc[muli0,addi0] + Theta[0] - Theta_0[muli0,addi0] <= 1
 SizingConstr2: Rc[addi0,oehb3] + Theta[0] - Theta_0[addi0,oehb3] <= 1
 SizingConstr2: Rc[addi1,oehb4] + Theta[0] - Theta_0[addi1,oehb4] <= 1
 SizingConstr2: Rc[oehb4,tehb4] + Theta[0] - Theta_0[oehb4,tehb4] <= 1
 SizingConstr2: Rc[tehb4,fork4] + Theta[0] - Theta_0[tehb4,fork4] <= 1
 SizingConstr2: Rc[fork4,trunci0] + Theta[0] - Theta_0[fork4,trunci0] <= 1
 SizingConstr2: Rc[fork4,cmpi1] + Theta[0] - Theta_0[fork4,cmpi1] <= 1
 SizingConstr2: Rc[trunci0,cond_br0] + Theta[0] - Theta_0[trunci0,cond_br0]
   <= 1
 SizingConstr2: Rc[cmpi1,fork5] + Theta[0] - Theta_0[cmpi1,fork5] <= 1
 SizingConstr2: Rc[fork5,cond_br0] + Theta[0] - Theta_0[fork5,cond_br0]
   <= 1
 SizingConstr2: Rc[fork5,tehb5] + Theta[0] - Theta_0[fork5,tehb5] <= 1
 SizingConstr2: Rc[fork5,cond_br3] + Theta[0] - Theta_0[fork5,cond_br3]
   <= 1
 SizingConstr2: Rc[cond_br0,oehb5] + Theta[0] - Theta_0[cond_br0,oehb5]
   <= 1
 SizingConstr2: Rc[oehb3,cond_br2] + Theta[0] - Theta_0[oehb3,cond_br2]
   <= 1
 SizingConstr2: Rc[tehb5,cond_br2] + Theta[0] - Theta_0[tehb5,cond_br2]
   <= 1
 SizingConstr2: Rc[cond_br2,oehb6] + Theta[0] - Theta_0[cond_br2,oehb6]
   <= 1
 SizingConstr2: Rc[tehb0,cond_br3] + Theta[0] - Theta_0[tehb0,cond_br3]
   <= 1
 SizingConstr2: Rc[cond_br3,oehb7] + Theta[0] - Theta_0[cond_br3,oehb7]
   <= 1
Bounds
 Theta[0] <= 1
Binaries
 Rc[start_0,fork0] Rc[fork0,constant1] Rc[fork0,control_merge2]
 Rc[constant1,fork1] Rc[fork1,extsi4] Rc[fork1,extsi5] Rc[extsi4,mux2]
 Rc[extsi5,mux1] Rc[oehb5,tehb6] Rc[tehb6,mux2] Rc[mux2,fork2]
 Rc[fork2,extsi6] Rc[fork2,extsi7] Rc[fork2,extsi8] Rc[extsi6,addi1]
 Rc[extsi7,subi1] Rc[extsi8,mc_load0] Rc[tehb2,mux1] Rc[oehb6,tehb7]
 Rc[tehb7,mux1] Rc[mux1,addi0] Rc[oehb7,control_merge2]
 Rc[control_merge2,oehb0] Rc[control_merge2,tehb0] Rc[oehb0,tehb1]
 Rc[tehb1,fork3] Rc[fork3,mux2] Rc[fork3,tehb2] Rc[source0,constant4]
 Rc[constant4,extsi9] Rc[extsi9,subi1] Rc[source1,constant8]
 Rc[constant8,extsi10] Rc[extsi10,cmpi1] Rc[source2,constant9]
 Rc[constant9,extsi11] Rc[extsi11,addi1] Rc[mc_load0,oehb1]
 Rc[mc_load0,mem_controller0] Rc[subi1,extsi12] Rc[extsi12,oehb2]
 Rc[oehb2,tehb3] Rc[tehb3,mc_load1] Rc[mc_load1,muli0]
 Rc[mc_load1,mem_controller1] Rc[oehb1,muli0] Rc[muli0,addi0]
 Rc[addi0,oehb3] Rc[addi1,oehb4] Rc[oehb4,tehb4] Rc[tehb4,fork4]
 Rc[fork4,trunci0] Rc[fork4,cmpi1] Rc[trunci0,cond_br0] Rc[cmpi1,fork5]
 Rc[fork5,cond_br0] Rc[fork5,tehb5] Rc[fork5,cond_br3] Rc[cond_br0,oehb5]
 Rc[cond_br0,sink0] Rc[oehb3,cond_br2] Rc[tehb5,cond_br2]
 Rc[cond_br2,oehb6] Rc[cond_br2,return1] Rc[tehb0,cond_br3]
 Rc[cond_br3,oehb7] Rc[cond_br3,sink1] Rc[return1,end0]
 Rc[mem_controller0,mc_load0] Rc[mem_controller0,end0]
 Rc[mem_controller1,mc_load1] Rc[mem_controller1,end0]
Generals
 Nc[start_0,fork0] Nc[fork0,constant1] Nc[fork0,control_merge2]
 Nc[constant1,fork1] Nc[fork1,extsi4] Nc[fork1,extsi5] Nc[extsi4,mux2]
 Nc[extsi5,mux1] Nc[oehb5,tehb6] Nc[tehb6,mux2] Nc[mux2,fork2]
 Nc[fork2,extsi6] Nc[fork2,extsi7] Nc[fork2,extsi8] Nc[extsi6,addi1]
 Nc[extsi7,subi1] Nc[extsi8,mc_load0] Nc[tehb2,mux1] Nc[oehb6,tehb7]
 Nc[tehb7,mux1] Nc[mux1,addi0] Nc[oehb7,control_merge2]
 Nc[control_merge2,oehb0] Nc[control_merge2,tehb0] Nc[oehb0,tehb1]
 Nc[tehb1,fork3] Nc[fork3,mux2] Nc[fork3,tehb2] Nc[source0,constant4]
 Nc[constant4,extsi9] Nc[extsi9,subi1] Nc[source1,constant8]
 Nc[constant8,extsi10] Nc[extsi10,cmpi1] Nc[source2,constant9]
 Nc[constant9,extsi11] Nc[extsi11,addi1] Nc[mc_load0,oehb1]
 Nc[mc_load0,mem_controller0] Nc[subi1,extsi12] Nc[extsi12,oehb2]
 Nc[oehb2,tehb3] Nc[tehb3,mc_load1] Nc[mc_load1,muli0]
 Nc[mc_load1,mem_controller1] Nc[oehb1,muli0] Nc[muli0,addi0]
 Nc[addi0,oehb3] Nc[addi1,oehb4] Nc[oehb4,tehb4] Nc[tehb4,fork4]
 Nc[fork4,trunci0] Nc[fork4,cmpi1] Nc[trunci0,cond_br0] Nc[cmpi1,fork5]
 Nc[fork5,cond_br0] Nc[fork5,tehb5] Nc[fork5,cond_br3] Nc[cond_br0,oehb5]
 Nc[cond_br0,sink0] Nc[oehb3,cond_br2] Nc[tehb5,cond_br2]
 Nc[cond_br2,oehb6] Nc[cond_br2,return1] Nc[tehb0,cond_br3]
 Nc[cond_br3,oehb7] Nc[cond_br3,sink1] Nc[return1,end0]
 Nc[mem_controller0,mc_load0] Nc[mem_controller0,end0]
 Nc[mem_controller1,mc_load1] Nc[mem_controller1,end0]
End
