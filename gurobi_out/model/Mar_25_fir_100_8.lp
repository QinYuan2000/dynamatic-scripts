\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  - 1e-05 Nc[start_0,fork0] - 1e-05 Nc[fork0,constant1]
   - 1e-05 Nc[fork0,control_merge2] - 1e-05 Nc[constant1,fork1]
   - 1e-05 Nc[fork1,extsi4] - 1e-05 Nc[fork1,extsi5]
   - 1e-05 Nc[extsi4,mux2] - 1e-05 Nc[extsi5,mux1] - 1e-05 Nc[mux2,fork2]
   - 1e-05 Nc[fork2,extsi6] - 1e-05 Nc[fork2,extsi7]
   - 1e-05 Nc[fork2,extsi8] - 1e-05 Nc[extsi6,addi1]
   - 1e-05 Nc[extsi7,subi1] - 1e-05 Nc[extsi8,mc_load0_plin]
   - 1e-05 Nc[mux1,addi0] - 1e-05 Nc[control_merge2,fork3]
   - 1e-05 Nc[control_merge2,cond_br3] - 1e-05 Nc[fork3,mux2]
   - 1e-05 Nc[fork3,mux1] - 1e-05 Nc[source0,constant4]
   - 1e-05 Nc[constant4,extsi9] - 1e-05 Nc[extsi9,subi1]
   - 1e-05 Nc[source1,constant8] - 1e-05 Nc[constant8,extsi10]
   - 1e-05 Nc[extsi10,cmpi1] - 1e-05 Nc[source2,constant9]
   - 1e-05 Nc[constant9,extsi11] - 1e-05 Nc[extsi11,addi1]
   - 1e-05 Nc[mc_load0_plout,muli0_plin] - 1e-05 Nc[subi1,extsi12]
   - 1e-05 Nc[extsi12,mc_load1_plin] - 1e-05 Nc[mc_load1_plout,muli0_plin]
   - 1e-05 Nc[muli0_plout,addi0] - 1e-05 Nc[addi0,cond_br2]
   - 1e-05 Nc[addi1,fork4] - 1e-05 Nc[fork4,trunci0]
   - 1e-05 Nc[fork4,cmpi1] - 1e-05 Nc[trunci0,cond_br0]
   - 1e-05 Nc[cmpi1,fork5] - 1e-05 Nc[fork5,cond_br0]
   - 1e-05 Nc[fork5,cond_br2] - 1e-05 Nc[fork5,cond_br3]
   - 1e-05 Nc[cond_br0,mux2] - 1e-05 Nc[cond_br0,sink0]
   - 1e-05 Nc[cond_br2,mux1] - 1e-05 Nc[cond_br2,return1]
   - 1e-05 Nc[cond_br3,control_merge2] - 1e-05 Nc[cond_br3,sink1]
   - 1e-05 Nc[return1,end0] + Theta[0]
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
 PathConstr1[extsi8,mc_load0_plin]: 100 Rc[extsi8,mc_load0_plin]
   - Tin[extsi8,mc_load0_plin] + Tout[extsi8,mc_load0_plin] >= 0
 PathConstr1[mux1,addi0]: 100 Rc[mux1,addi0] - Tin[mux1,addi0]
   + Tout[mux1,addi0] >= 0
 PathConstr1[control_merge2,fork3]: 100 Rc[control_merge2,fork3]
   - Tin[control_merge2,fork3] + Tout[control_merge2,fork3] >= 0
 PathConstr1[control_merge2,cond_br3]: 100 Rc[control_merge2,cond_br3]
   - Tin[control_merge2,cond_br3] + Tout[control_merge2,cond_br3] >= 0
 PathConstr1[fork3,mux2]: 100 Rc[fork3,mux2] - Tin[fork3,mux2]
   + Tout[fork3,mux2] >= 0
 PathConstr1[fork3,mux1]: 100 Rc[fork3,mux1] - Tin[fork3,mux1]
   + Tout[fork3,mux1] >= 0
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
 PathConstr1[mc_load0_plout,muli0_plin]: 100 Rc[mc_load0_plout,muli0_plin]
   - Tin[mc_load0_plout,muli0_plin] + Tout[mc_load0_plout,muli0_plin] >= 0
 PathConstr1[subi1,extsi12]: 100 Rc[subi1,extsi12] - Tin[subi1,extsi12]
   + Tout[subi1,extsi12] >= 0
 PathConstr1[extsi12,mc_load1_plin]: 100 Rc[extsi12,mc_load1_plin]
   - Tin[extsi12,mc_load1_plin] + Tout[extsi12,mc_load1_plin] >= 0
 PathConstr1[mc_load1_plout,muli0_plin]: 100 Rc[mc_load1_plout,muli0_plin]
   - Tin[mc_load1_plout,muli0_plin] + Tout[mc_load1_plout,muli0_plin] >= 0
 PathConstr1[muli0_plout,addi0]: 100 Rc[muli0_plout,addi0]
   - Tin[muli0_plout,addi0] + Tout[muli0_plout,addi0] >= 0
 PathConstr1[addi0,cond_br2]: 100 Rc[addi0,cond_br2] - Tin[addi0,cond_br2]
   + Tout[addi0,cond_br2] >= 0
 PathConstr1[addi1,fork4]: 100 Rc[addi1,fork4] - Tin[addi1,fork4]
   + Tout[addi1,fork4] >= 0
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
 PathConstr1[fork5,cond_br2]: 100 Rc[fork5,cond_br2] - Tin[fork5,cond_br2]
   + Tout[fork5,cond_br2] >= 0
 PathConstr1[fork5,cond_br3]: 100 Rc[fork5,cond_br3] - Tin[fork5,cond_br3]
   + Tout[fork5,cond_br3] >= 0
 PathConstr1[cond_br0,mux2]: 100 Rc[cond_br0,mux2] - Tin[cond_br0,mux2]
   + Tout[cond_br0,mux2] >= 0
 PathConstr1[cond_br0,sink0]: 100 Rc[cond_br0,sink0] - Tin[cond_br0,sink0]
   + Tout[cond_br0,sink0] >= 0
 PathConstr1[cond_br2,mux1]: 100 Rc[cond_br2,mux1] - Tin[cond_br2,mux1]
   + Tout[cond_br2,mux1] >= 0
 PathConstr1[cond_br2,return1]: 100 Rc[cond_br2,return1]
   - Tin[cond_br2,return1] + Tout[cond_br2,return1] >= 0
 PathConstr1[cond_br3,control_merge2]: 100 Rc[cond_br3,control_merge2]
   - Tin[cond_br3,control_merge2] + Tout[cond_br3,control_merge2] >= 0
 PathConstr1[cond_br3,sink1]: 100 Rc[cond_br3,sink1] - Tin[cond_br3,sink1]
   + Tout[cond_br3,sink1] >= 0
 PathConstr1[return1,end0]: 100 Rc[return1,end0] - Tin[return1,end0]
   + Tout[return1,end0] >= 0
 PathConstr2[start_0,fork0]: Tin[start_0,fork0] <= 8
 PathConstr2[fork0,constant1]: Tin[fork0,constant1] <= 8
 PathConstr2[fork0,control_merge2]: Tin[fork0,control_merge2] <= 8
 PathConstr2[constant1,fork1]: Tin[constant1,fork1] <= 8
 PathConstr2[fork1,extsi4]: Tin[fork1,extsi4] <= 8
 PathConstr2[fork1,extsi5]: Tin[fork1,extsi5] <= 8
 PathConstr2[extsi4,mux2]: Tin[extsi4,mux2] <= 8
 PathConstr2[extsi5,mux1]: Tin[extsi5,mux1] <= 8
 PathConstr2[mux2,fork2]: Tin[mux2,fork2] <= 8
 PathConstr2[fork2,extsi6]: Tin[fork2,extsi6] <= 8
 PathConstr2[fork2,extsi7]: Tin[fork2,extsi7] <= 8
 PathConstr2[fork2,extsi8]: Tin[fork2,extsi8] <= 8
 PathConstr2[extsi6,addi1]: Tin[extsi6,addi1] <= 8
 PathConstr2[extsi7,subi1]: Tin[extsi7,subi1] <= 8
 PathConstr2[extsi8,mc_load0_plin]: Tin[extsi8,mc_load0_plin] <= 8
 PathConstr2[mux1,addi0]: Tin[mux1,addi0] <= 8
 PathConstr2[control_merge2,fork3]: Tin[control_merge2,fork3] <= 8
 PathConstr2[control_merge2,cond_br3]: Tin[control_merge2,cond_br3] <= 8
 PathConstr2[fork3,mux2]: Tin[fork3,mux2] <= 8
 PathConstr2[fork3,mux1]: Tin[fork3,mux1] <= 8
 PathConstr2[source0,constant4]: Tin[source0,constant4] <= 8
 PathConstr2[constant4,extsi9]: Tin[constant4,extsi9] <= 8
 PathConstr2[extsi9,subi1]: Tin[extsi9,subi1] <= 8
 PathConstr2[source1,constant8]: Tin[source1,constant8] <= 8
 PathConstr2[constant8,extsi10]: Tin[constant8,extsi10] <= 8
 PathConstr2[extsi10,cmpi1]: Tin[extsi10,cmpi1] <= 8
 PathConstr2[source2,constant9]: Tin[source2,constant9] <= 8
 PathConstr2[constant9,extsi11]: Tin[constant9,extsi11] <= 8
 PathConstr2[extsi11,addi1]: Tin[extsi11,addi1] <= 8
 PathConstr2[mc_load0_plout,muli0_plin]: Tin[mc_load0_plout,muli0_plin]
   <= 8
 PathConstr2[subi1,extsi12]: Tin[subi1,extsi12] <= 8
 PathConstr2[extsi12,mc_load1_plin]: Tin[extsi12,mc_load1_plin] <= 8
 PathConstr2[mc_load1_plout,muli0_plin]: Tin[mc_load1_plout,muli0_plin]
   <= 8
 PathConstr2[muli0_plout,addi0]: Tin[muli0_plout,addi0] <= 8
 PathConstr2[addi0,cond_br2]: Tin[addi0,cond_br2] <= 8
 PathConstr2[addi1,fork4]: Tin[addi1,fork4] <= 8
 PathConstr2[fork4,trunci0]: Tin[fork4,trunci0] <= 8
 PathConstr2[fork4,cmpi1]: Tin[fork4,cmpi1] <= 8
 PathConstr2[trunci0,cond_br0]: Tin[trunci0,cond_br0] <= 8
 PathConstr2[cmpi1,fork5]: Tin[cmpi1,fork5] <= 8
 PathConstr2[fork5,cond_br0]: Tin[fork5,cond_br0] <= 8
 PathConstr2[fork5,cond_br2]: Tin[fork5,cond_br2] <= 8
 PathConstr2[fork5,cond_br3]: Tin[fork5,cond_br3] <= 8
 PathConstr2[cond_br0,mux2]: Tin[cond_br0,mux2] <= 8
 PathConstr2[cond_br0,sink0]: Tin[cond_br0,sink0] <= 8
 PathConstr2[cond_br2,mux1]: Tin[cond_br2,mux1] <= 8
 PathConstr2[cond_br2,return1]: Tin[cond_br2,return1] <= 8
 PathConstr2[cond_br3,control_merge2]: Tin[cond_br3,control_merge2] <= 8
 PathConstr2[cond_br3,sink1]: Tin[cond_br3,sink1] <= 8
 PathConstr2[return1,end0]: Tin[return1,end0] <= 8
 PathConstr2[mc_load0_plin,mc_load0_plout]:
   Tin[mc_load0_plin,mc_load0_plout] <= 8
 PathConstr2[mc_load1_plin,mc_load1_plout]:
   Tin[mc_load1_plin,mc_load1_plout] <= 8
 PathConstr2[muli0_plin,muli0_plout]: Tin[muli0_plin,muli0_plout] <= 8
 PathConstr3_nopl: Tin[fork0,constant1] - Tout[start_0,fork0] >= 0.0001
 PathConstr3_nopl: Tin[fork0,control_merge2] - Tout[start_0,fork0]
   >= 0.0001
 PathConstr3_nopl: Tin[constant1,fork1] - Tout[fork0,constant1] >= 0.0001
 PathConstr3_nopl: Tin[fork1,extsi4] - Tout[constant1,fork1] >= 0.0001
 PathConstr3_nopl: Tin[fork1,extsi5] - Tout[constant1,fork1] >= 0.0001
 PathConstr3_nopl: Tin[extsi4,mux2] - Tout[fork1,extsi4] >= 0.0001
 PathConstr3_nopl: Tin[extsi5,mux1] - Tout[fork1,extsi5] >= 0.0001
 PathConstr3_nopl: Tin[mux2,fork2] - Tout[extsi4,mux2] >= 1.412
 PathConstr3_nopl: Tin[mux2,fork2] - Tout[fork3,mux2] >= 1.412
 PathConstr3_nopl: Tin[mux2,fork2] - Tout[cond_br0,mux2] >= 1.412
 PathConstr3_nopl: Tin[fork2,extsi6] - Tout[mux2,fork2] >= 0.0001
 PathConstr3_nopl: Tin[fork2,extsi7] - Tout[mux2,fork2] >= 0.0001
 PathConstr3_nopl: Tin[fork2,extsi8] - Tout[mux2,fork2] >= 0.0001
 PathConstr3_nopl: Tin[extsi6,addi1] - Tout[fork2,extsi6] >= 0.0001
 PathConstr3_nopl: Tin[extsi7,subi1] - Tout[fork2,extsi7] >= 0.0001
 PathConstr3_nopl: Tin[extsi8,mc_load0_plin] - Tout[fork2,extsi8]
   >= 0.0001
 PathConstr3_nopl: Tin[mux1,addi0] - Tout[extsi5,mux1] >= 1.412
 PathConstr3_nopl: Tin[mux1,addi0] - Tout[fork3,mux1] >= 1.412
 PathConstr3_nopl: Tin[mux1,addi0] - Tout[cond_br2,mux1] >= 1.412
 PathConstr3_nopl: Tin[control_merge2,fork3] - Tout[fork0,control_merge2]
   >= 0.0001
 PathConstr3_nopl: Tin[control_merge2,cond_br3]
   - Tout[fork0,control_merge2] >= 0.0001
 PathConstr3_nopl: Tin[control_merge2,fork3]
   - Tout[cond_br3,control_merge2] >= 0.0001
 PathConstr3_nopl: Tin[control_merge2,cond_br3]
   - Tout[cond_br3,control_merge2] >= 0.0001
 PathConstr3_nopl: Tin[fork3,mux2] - Tout[control_merge2,fork3] >= 0.0001
 PathConstr3_nopl: Tin[fork3,mux1] - Tout[control_merge2,fork3] >= 0.0001
 PathConstr3_nopl: Tin[constant4,extsi9] - Tout[source0,constant4]
   >= 0.0001
 PathConstr3_nopl: Tin[extsi9,subi1] - Tout[constant4,extsi9] >= 0.0001
 PathConstr3_nopl: Tin[constant8,extsi10] - Tout[source1,constant8]
   >= 0.0001
 PathConstr3_nopl: Tin[extsi10,cmpi1] - Tout[constant8,extsi10] >= 0.0001
 PathConstr3_nopl: Tin[constant9,extsi11] - Tout[source2,constant9]
   >= 0.0001
 PathConstr3_nopl: Tin[extsi11,addi1] - Tout[constant9,extsi11] >= 0.0001
 PathConstr3_nopl: Tin[subi1,extsi12] - Tout[extsi7,subi1] >= 2.047
 PathConstr3_nopl: Tin[subi1,extsi12] - Tout[extsi9,subi1] >= 2.047
 PathConstr3_nopl: Tin[extsi12,mc_load1_plin] - Tout[subi1,extsi12]
   >= 0.0001
 PathConstr3_nopl: Tin[addi0,cond_br2] - Tout[mux1,addi0] >= 2.287
 PathConstr3_nopl: Tin[addi0,cond_br2] - Tout[muli0_plout,addi0] >= 2.287
 PathConstr3_nopl: Tin[addi1,fork4] - Tout[extsi6,addi1] >= 2.047
 PathConstr3_nopl: Tin[addi1,fork4] - Tout[extsi11,addi1] >= 2.047
 PathConstr3_nopl: Tin[fork4,trunci0] - Tout[addi1,fork4] >= 0.0001
 PathConstr3_nopl: Tin[fork4,cmpi1] - Tout[addi1,fork4] >= 0.0001
 PathConstr3_nopl: Tin[trunci0,cond_br0] - Tout[fork4,trunci0] >= 0.0001
 PathConstr3_nopl: Tin[cmpi1,fork5] - Tout[extsi10,cmpi1] >= 1.808
 PathConstr3_nopl: Tin[cmpi1,fork5] - Tout[fork4,cmpi1] >= 1.808
 PathConstr3_nopl: Tin[fork5,cond_br0] - Tout[cmpi1,fork5] >= 0.0001
 PathConstr3_nopl: Tin[fork5,cond_br2] - Tout[cmpi1,fork5] >= 0.0001
 PathConstr3_nopl: Tin[fork5,cond_br3] - Tout[cmpi1,fork5] >= 0.0001
 PathConstr3_nopl: Tin[cond_br0,mux2] - Tout[trunci0,cond_br0] >= 0.0001
 PathConstr3_nopl: Tin[cond_br0,sink0] - Tout[trunci0,cond_br0] >= 0.0001
 PathConstr3_nopl: Tin[cond_br0,mux2] - Tout[fork5,cond_br0] >= 0.0001
 PathConstr3_nopl: Tin[cond_br0,sink0] - Tout[fork5,cond_br0] >= 0.0001
 PathConstr3_nopl: Tin[cond_br2,mux1] - Tout[addi0,cond_br2] >= 0.0001
 PathConstr3_nopl: Tin[cond_br2,return1] - Tout[addi0,cond_br2] >= 0.0001
 PathConstr3_nopl: Tin[cond_br2,mux1] - Tout[fork5,cond_br2] >= 0.0001
 PathConstr3_nopl: Tin[cond_br2,return1] - Tout[fork5,cond_br2] >= 0.0001
 PathConstr3_nopl: Tin[cond_br3,control_merge2]
   - Tout[control_merge2,cond_br3] >= 0.0001
 PathConstr3_nopl: Tin[cond_br3,sink1] - Tout[control_merge2,cond_br3]
   >= 0.0001
 PathConstr3_nopl: Tin[cond_br3,control_merge2] - Tout[fork5,cond_br3]
   >= 0.0001
 PathConstr3_nopl: Tin[cond_br3,sink1] - Tout[fork5,cond_br3] >= 0.0001
 PathConstr3_nopl: Tin[return1,end0] - Tout[cond_br2,return1] >= 1.412
 PathConstr3_conpl: Tin[mc_load0_plin,mc_load0_plout]
   - Tout[extsi8,mc_load0_plin] >= 1.412
 PathConstr3_conpl: Tin[mc_load0_plout,muli0_plin]
   - Tout[mc_load0_plin,mc_load0_plout] >= 1.412
 PathConstr3_conpl: Tin[mc_load1_plin,mc_load1_plout]
   - Tout[extsi12,mc_load1_plin] >= 1.412
 PathConstr3_conpl: Tin[mc_load1_plout,muli0_plin]
   - Tout[mc_load1_plin,mc_load1_plout] >= 1.412
 PathConstr3_conpl: Tin[muli0_plin,muli0_plout]
   - Tout[mc_load0_plout,muli0_plin] >= 0
 PathConstr3_conpl: Tin[muli0_plin,muli0_plout]
   - Tout[mc_load1_plout,muli0_plin] >= 0
 PathConstr3_conpl: Tin[muli0_plout,addi0] - Tout[muli0_plin,muli0_plout]
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
 ThroughputConstr1[extsi8,mc_load0_plin]: Theta_1[extsi8,mc_load0_plin]
   + ru[extsi8] - ru[mc_load0_plin] = 0
 ThroughputConstr1[mux1,addi0]: Theta_1[mux1,addi0] + ru[mux1] - ru[addi0]
   = 0
 ThroughputConstr1[control_merge2,fork3]: Theta_1[control_merge2,fork3]
   + ru[control_merge2] - ru[fork3] = 0
 ThroughputConstr1[control_merge2,cond_br3]:
   Theta_1[control_merge2,cond_br3] + ru[control_merge2] - ru[cond_br3]
   = 0
 ThroughputConstr1[fork3,mux2]: Theta_1[fork3,mux2] - ru[mux2] + ru[fork3]
   = 0
 ThroughputConstr1[fork3,mux1]: Theta_1[fork3,mux1] - ru[mux1] + ru[fork3]
   = 0
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
 ThroughputConstr1[mc_load0_plout,muli0_plin]:
   Theta_1[mc_load0_plout,muli0_plin] + ru[mc_load0_plout] - ru[muli0_plin]
   = 0
 ThroughputConstr1[subi1,extsi12]: Theta_1[subi1,extsi12] + ru[subi1]
   - ru[extsi12] = 0
 ThroughputConstr1[extsi12,mc_load1_plin]: Theta_1[extsi12,mc_load1_plin]
   + ru[extsi12] - ru[mc_load1_plin] = 0
 ThroughputConstr1[mc_load1_plout,muli0_plin]:
   Theta_1[mc_load1_plout,muli0_plin] + ru[mc_load1_plout] - ru[muli0_plin]
   = 0
 ThroughputConstr1[muli0_plout,addi0]: Theta_1[muli0_plout,addi0]
   + ru[muli0_plout] - ru[addi0] = 0
 ThroughputConstr1[addi0,cond_br2]: Theta_1[addi0,cond_br2] + ru[addi0]
   - ru[cond_br2] = 0
 ThroughputConstr1[addi1,fork4]: Theta_1[addi1,fork4] + ru[addi1]
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
 ThroughputConstr1[fork5,cond_br2]: Theta_1[fork5,cond_br2] + ru[fork5]
   - ru[cond_br2] = 0
 ThroughputConstr1[fork5,cond_br3]: Theta_1[fork5,cond_br3] + ru[fork5]
   - ru[cond_br3] = 0
 ThroughputConstr1[cond_br0,mux2]: Theta_1[cond_br0,mux2] - ru[mux2]
   + ru[cond_br0] = 1
 ThroughputConstr1[cond_br0,sink0]: Theta_1[cond_br0,sink0] + ru[cond_br0]
   - ru[sink0] = 0
 ThroughputConstr1[cond_br2,mux1]: Theta_1[cond_br2,mux1] - ru[mux1]
   + ru[cond_br2] = 1
 ThroughputConstr1[cond_br2,return1]: Theta_1[cond_br2,return1]
   + ru[cond_br2] - ru[return1] = 0
 ThroughputConstr1[cond_br3,control_merge2]:
   Theta_1[cond_br3,control_merge2] - ru[control_merge2] + ru[cond_br3]
   = 1
 ThroughputConstr1[cond_br3,sink1]: Theta_1[cond_br3,sink1] + ru[cond_br3]
   - ru[sink1] = 0
 ThroughputConstr1[return1,end0]: Theta_1[return1,end0] + ru[return1]
   - ru[end0] = 0
 ThroughputConstr1[mc_load0_plin,mc_load0_plout]:
   Theta_1[mc_load0_plin,mc_load0_plout] + ru[mc_load0_plin]
   - ru[mc_load0_plout] = 0
 ThroughputConstr1[mc_load1_plin,mc_load1_plout]:
   Theta_1[mc_load1_plin,mc_load1_plout] + ru[mc_load1_plin]
   - ru[mc_load1_plout] = 0
 ThroughputConstr1[muli0_plin,muli0_plout]: Theta_1[muli0_plin,muli0_plout]
   + ru[muli0_plin] - ru[muli0_plout] = 0
 ThroughputConstr2_nopl: Rc[mux2,fork2] + Theta[0] - Theta_1[mux2,fork2]
   <= 1
 ThroughputConstr2_nopl: Rc[fork2,extsi6] + Theta[0]
   - Theta_1[fork2,extsi6] <= 1
 ThroughputConstr2_nopl: Rc[fork2,extsi7] + Theta[0]
   - Theta_1[fork2,extsi7] <= 1
 ThroughputConstr2_nopl: Rc[fork2,extsi8] + Theta[0]
   - Theta_1[fork2,extsi8] <= 1
 ThroughputConstr2_nopl: Rc[extsi6,addi1] + Theta[0]
   - Theta_1[extsi6,addi1] <= 1
 ThroughputConstr2_nopl: Rc[extsi7,subi1] + Theta[0]
   - Theta_1[extsi7,subi1] <= 1
 ThroughputConstr2_nopl: Rc[extsi8,mc_load0_plin] + Theta[0]
   - Theta_1[extsi8,mc_load0_plin] <= 1
 ThroughputConstr2_nopl: Rc[mux1,addi0] + Theta[0] - Theta_1[mux1,addi0]
   <= 1
 ThroughputConstr2_nopl: Rc[control_merge2,fork3] + Theta[0]
   - Theta_1[control_merge2,fork3] <= 1
 ThroughputConstr2_nopl: Rc[control_merge2,cond_br3] + Theta[0]
   - Theta_1[control_merge2,cond_br3] <= 1
 ThroughputConstr2_nopl: Rc[fork3,mux2] + Theta[0] - Theta_1[fork3,mux2]
   <= 1
 ThroughputConstr2_nopl: Rc[fork3,mux1] + Theta[0] - Theta_1[fork3,mux1]
   <= 1
 ThroughputConstr2_nopl: Rc[source0,constant4] + Theta[0]
   - Theta_1[source0,constant4] <= 1
 ThroughputConstr2_nopl: Rc[constant4,extsi9] + Theta[0]
   - Theta_1[constant4,extsi9] <= 1
 ThroughputConstr2_nopl: Rc[extsi9,subi1] + Theta[0]
   - Theta_1[extsi9,subi1] <= 1
 ThroughputConstr2_nopl: Rc[source1,constant8] + Theta[0]
   - Theta_1[source1,constant8] <= 1
 ThroughputConstr2_nopl: Rc[constant8,extsi10] + Theta[0]
   - Theta_1[constant8,extsi10] <= 1
 ThroughputConstr2_nopl: Rc[extsi10,cmpi1] + Theta[0]
   - Theta_1[extsi10,cmpi1] <= 1
 ThroughputConstr2_nopl: Rc[source2,constant9] + Theta[0]
   - Theta_1[source2,constant9] <= 1
 ThroughputConstr2_nopl: Rc[constant9,extsi11] + Theta[0]
   - Theta_1[constant9,extsi11] <= 1
 ThroughputConstr2_nopl: Rc[extsi11,addi1] + Theta[0]
   - Theta_1[extsi11,addi1] <= 1
 ThroughputConstr2_nopl: Rc[mc_load0_plout,muli0_plin] + Theta[0]
   - Theta_1[mc_load0_plout,muli0_plin] <= 1
 ThroughputConstr2_nopl: Rc[subi1,extsi12] + Theta[0]
   - Theta_1[subi1,extsi12] <= 1
 ThroughputConstr2_nopl: Rc[extsi12,mc_load1_plin] + Theta[0]
   - Theta_1[extsi12,mc_load1_plin] <= 1
 ThroughputConstr2_nopl: Rc[mc_load1_plout,muli0_plin] + Theta[0]
   - Theta_1[mc_load1_plout,muli0_plin] <= 1
 ThroughputConstr2_nopl: Rc[muli0_plout,addi0] + Theta[0]
   - Theta_1[muli0_plout,addi0] <= 1
 ThroughputConstr2_nopl: Rc[addi0,cond_br2] + Theta[0]
   - Theta_1[addi0,cond_br2] <= 1
 ThroughputConstr2_nopl: Rc[addi1,fork4] + Theta[0] - Theta_1[addi1,fork4]
   <= 1
 ThroughputConstr2_nopl: Rc[fork4,trunci0] + Theta[0]
   - Theta_1[fork4,trunci0] <= 1
 ThroughputConstr2_nopl: Rc[fork4,cmpi1] + Theta[0] - Theta_1[fork4,cmpi1]
   <= 1
 ThroughputConstr2_nopl: Rc[trunci0,cond_br0] + Theta[0]
   - Theta_1[trunci0,cond_br0] <= 1
 ThroughputConstr2_nopl: Rc[cmpi1,fork5] + Theta[0] - Theta_1[cmpi1,fork5]
   <= 1
 ThroughputConstr2_nopl: Rc[fork5,cond_br0] + Theta[0]
   - Theta_1[fork5,cond_br0] <= 1
 ThroughputConstr2_nopl: Rc[fork5,cond_br2] + Theta[0]
   - Theta_1[fork5,cond_br2] <= 1
 ThroughputConstr2_nopl: Rc[fork5,cond_br3] + Theta[0]
   - Theta_1[fork5,cond_br3] <= 1
 ThroughputConstr2_nopl: Rc[cond_br0,mux2] + Theta[0]
   - Theta_1[cond_br0,mux2] <= 1
 ThroughputConstr2_nopl: Rc[cond_br2,mux1] + Theta[0]
   - Theta_1[cond_br2,mux1] <= 1
 ThroughputConstr2_nopl: Rc[cond_br3,control_merge2] + Theta[0]
   - Theta_1[cond_br3,control_merge2] <= 1
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
 SizingConstr1[extsi8,mc_load0_plin]: Nc[extsi8,mc_load0_plin]
   - Theta_1[extsi8,mc_load0_plin] - Theta_0[extsi8,mc_load0_plin] = 0
 SizingConstr1[mux1,addi0]: Nc[mux1,addi0] - Theta_1[mux1,addi0]
   - Theta_0[mux1,addi0] = 0
 SizingConstr1[control_merge2,fork3]: Nc[control_merge2,fork3]
   - Theta_1[control_merge2,fork3] - Theta_0[control_merge2,fork3] = 0
 SizingConstr1[control_merge2,cond_br3]: Nc[control_merge2,cond_br3]
   - Theta_1[control_merge2,cond_br3] - Theta_0[control_merge2,cond_br3]
   = 0
 SizingConstr1[fork3,mux2]: Nc[fork3,mux2] - Theta_1[fork3,mux2]
   - Theta_0[fork3,mux2] = 0
 SizingConstr1[fork3,mux1]: Nc[fork3,mux1] - Theta_1[fork3,mux1]
   - Theta_0[fork3,mux1] = 0
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
 SizingConstr1[mc_load0_plout,muli0_plin]: Nc[mc_load0_plout,muli0_plin]
   - Theta_1[mc_load0_plout,muli0_plin]
   - Theta_0[mc_load0_plout,muli0_plin] = 0
 SizingConstr1[subi1,extsi12]: Nc[subi1,extsi12] - Theta_1[subi1,extsi12]
   - Theta_0[subi1,extsi12] = 0
 SizingConstr1[extsi12,mc_load1_plin]: Nc[extsi12,mc_load1_plin]
   - Theta_1[extsi12,mc_load1_plin] - Theta_0[extsi12,mc_load1_plin] = 0
 SizingConstr1[mc_load1_plout,muli0_plin]: Nc[mc_load1_plout,muli0_plin]
   - Theta_1[mc_load1_plout,muli0_plin]
   - Theta_0[mc_load1_plout,muli0_plin] = 0
 SizingConstr1[muli0_plout,addi0]: Nc[muli0_plout,addi0]
   - Theta_1[muli0_plout,addi0] - Theta_0[muli0_plout,addi0] = 0
 SizingConstr1[addi0,cond_br2]: Nc[addi0,cond_br2]
   - Theta_1[addi0,cond_br2] - Theta_0[addi0,cond_br2] = 0
 SizingConstr1[addi1,fork4]: Nc[addi1,fork4] - Theta_1[addi1,fork4]
   - Theta_0[addi1,fork4] = 0
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
 SizingConstr1[fork5,cond_br2]: Nc[fork5,cond_br2]
   - Theta_1[fork5,cond_br2] - Theta_0[fork5,cond_br2] = 0
 SizingConstr1[fork5,cond_br3]: Nc[fork5,cond_br3]
   - Theta_1[fork5,cond_br3] - Theta_0[fork5,cond_br3] = 0
 SizingConstr1[cond_br0,mux2]: Nc[cond_br0,mux2] - Theta_1[cond_br0,mux2]
   - Theta_0[cond_br0,mux2] = 0
 SizingConstr1[cond_br0,sink0]: Nc[cond_br0,sink0]
   - Theta_1[cond_br0,sink0] - Theta_0[cond_br0,sink0] = 0
 SizingConstr1[cond_br2,mux1]: Nc[cond_br2,mux1] - Theta_1[cond_br2,mux1]
   - Theta_0[cond_br2,mux1] = 0
 SizingConstr1[cond_br2,return1]: Nc[cond_br2,return1]
   - Theta_1[cond_br2,return1] - Theta_0[cond_br2,return1] = 0
 SizingConstr1[cond_br3,control_merge2]: Nc[cond_br3,control_merge2]
   - Theta_1[cond_br3,control_merge2] - Theta_0[cond_br3,control_merge2]
   = 0
 SizingConstr1[cond_br3,sink1]: Nc[cond_br3,sink1]
   - Theta_1[cond_br3,sink1] - Theta_0[cond_br3,sink1] = 0
 SizingConstr1[return1,end0]: Nc[return1,end0] - Theta_1[return1,end0]
   - Theta_0[return1,end0] = 0
 SizingConstr2_nopl: Rc[mux2,fork2] + Theta[0] - Theta_0[mux2,fork2] <= 1
 SizingConstr2_nopl: Rc[fork2,extsi6] + Theta[0] - Theta_0[fork2,extsi6]
   <= 1
 SizingConstr2_nopl: Rc[fork2,extsi7] + Theta[0] - Theta_0[fork2,extsi7]
   <= 1
 SizingConstr2_nopl: Rc[fork2,extsi8] + Theta[0] - Theta_0[fork2,extsi8]
   <= 1
 SizingConstr2_nopl: Rc[extsi6,addi1] + Theta[0] - Theta_0[extsi6,addi1]
   <= 1
 SizingConstr2_nopl: Rc[extsi7,subi1] + Theta[0] - Theta_0[extsi7,subi1]
   <= 1
 SizingConstr2_nopl: Rc[extsi8,mc_load0_plin] + Theta[0]
   - Theta_0[extsi8,mc_load0_plin] <= 1
 SizingConstr2_nopl: Rc[mux1,addi0] + Theta[0] - Theta_0[mux1,addi0] <= 1
 SizingConstr2_nopl: Rc[control_merge2,fork3] + Theta[0]
   - Theta_0[control_merge2,fork3] <= 1
 SizingConstr2_nopl: Rc[control_merge2,cond_br3] + Theta[0]
   - Theta_0[control_merge2,cond_br3] <= 1
 SizingConstr2_nopl: Rc[fork3,mux2] + Theta[0] - Theta_0[fork3,mux2] <= 1
 SizingConstr2_nopl: Rc[fork3,mux1] + Theta[0] - Theta_0[fork3,mux1] <= 1
 SizingConstr2_nopl: Rc[source0,constant4] + Theta[0]
   - Theta_0[source0,constant4] <= 1
 SizingConstr2_nopl: Rc[constant4,extsi9] + Theta[0]
   - Theta_0[constant4,extsi9] <= 1
 SizingConstr2_nopl: Rc[extsi9,subi1] + Theta[0] - Theta_0[extsi9,subi1]
   <= 1
 SizingConstr2_nopl: Rc[source1,constant8] + Theta[0]
   - Theta_0[source1,constant8] <= 1
 SizingConstr2_nopl: Rc[constant8,extsi10] + Theta[0]
   - Theta_0[constant8,extsi10] <= 1
 SizingConstr2_nopl: Rc[extsi10,cmpi1] + Theta[0] - Theta_0[extsi10,cmpi1]
   <= 1
 SizingConstr2_nopl: Rc[source2,constant9] + Theta[0]
   - Theta_0[source2,constant9] <= 1
 SizingConstr2_nopl: Rc[constant9,extsi11] + Theta[0]
   - Theta_0[constant9,extsi11] <= 1
 SizingConstr2_nopl: Rc[extsi11,addi1] + Theta[0] - Theta_0[extsi11,addi1]
   <= 1
 SizingConstr2_nopl: Rc[mc_load0_plout,muli0_plin] + Theta[0]
   - Theta_0[mc_load0_plout,muli0_plin] <= 1
 SizingConstr2_nopl: Rc[subi1,extsi12] + Theta[0] - Theta_0[subi1,extsi12]
   <= 1
 SizingConstr2_nopl: Rc[extsi12,mc_load1_plin] + Theta[0]
   - Theta_0[extsi12,mc_load1_plin] <= 1
 SizingConstr2_nopl: Rc[mc_load1_plout,muli0_plin] + Theta[0]
   - Theta_0[mc_load1_plout,muli0_plin] <= 1
 SizingConstr2_nopl: Rc[muli0_plout,addi0] + Theta[0]
   - Theta_0[muli0_plout,addi0] <= 1
 SizingConstr2_nopl: Rc[addi0,cond_br2] + Theta[0]
   - Theta_0[addi0,cond_br2] <= 1
 SizingConstr2_nopl: Rc[addi1,fork4] + Theta[0] - Theta_0[addi1,fork4]
   <= 1
 SizingConstr2_nopl: Rc[fork4,trunci0] + Theta[0] - Theta_0[fork4,trunci0]
   <= 1
 SizingConstr2_nopl: Rc[fork4,cmpi1] + Theta[0] - Theta_0[fork4,cmpi1]
   <= 1
 SizingConstr2_nopl: Rc[trunci0,cond_br0] + Theta[0]
   - Theta_0[trunci0,cond_br0] <= 1
 SizingConstr2_nopl: Rc[cmpi1,fork5] + Theta[0] - Theta_0[cmpi1,fork5]
   <= 1
 SizingConstr2_nopl: Rc[fork5,cond_br0] + Theta[0]
   - Theta_0[fork5,cond_br0] <= 1
 SizingConstr2_nopl: Rc[fork5,cond_br2] + Theta[0]
   - Theta_0[fork5,cond_br2] <= 1
 SizingConstr2_nopl: Rc[fork5,cond_br3] + Theta[0]
   - Theta_0[fork5,cond_br3] <= 1
 SizingConstr2_nopl: Rc[cond_br0,mux2] + Theta[0] - Theta_0[cond_br0,mux2]
   <= 1
 SizingConstr2_nopl: Rc[cond_br2,mux1] + Theta[0] - Theta_0[cond_br2,mux1]
   <= 1
 SizingConstr2_nopl: Rc[cond_br3,control_merge2] + Theta[0]
   - Theta_0[cond_br3,control_merge2] <= 1
 PipelineConstr2_conpl: Theta[0] - Theta_1[mc_load0_plin,mc_load0_plout]
   <= 0
 PipelineConstr3_conpl: Theta_1[mc_load0_plin,mc_load0_plout] <= 1
 PipelineConstr2_conpl: Theta[0] - Theta_1[mc_load1_plin,mc_load1_plout]
   <= 0
 PipelineConstr3_conpl: Theta_1[mc_load1_plin,mc_load1_plout] <= 1
 PipelineConstr2_conpl: 4 Theta[0] - Theta_1[muli0_plin,muli0_plout] <= 0
 PipelineConstr3_conpl: Theta_1[muli0_plin,muli0_plout] <= 4
 ExtraConstr[start_0,fork0]: - Rc[start_0,fork0] + Nc[start_0,fork0] >= 0
 ExtraConstr[fork0,constant1]: - Rc[fork0,constant1] + Nc[fork0,constant1]
   >= 0
 ExtraConstr[fork0,control_merge2]: - Rc[fork0,control_merge2]
   + Nc[fork0,control_merge2] >= 0
 ExtraConstr[constant1,fork1]: - Rc[constant1,fork1] + Nc[constant1,fork1]
   >= 0
 ExtraConstr[fork1,extsi4]: - Rc[fork1,extsi4] + Nc[fork1,extsi4] >= 0
 ExtraConstr[fork1,extsi5]: - Rc[fork1,extsi5] + Nc[fork1,extsi5] >= 0
 ExtraConstr[extsi4,mux2]: - Rc[extsi4,mux2] + Nc[extsi4,mux2] >= 0
 ExtraConstr[extsi5,mux1]: - Rc[extsi5,mux1] + Nc[extsi5,mux1] >= 0
 ExtraConstr[mux2,fork2]: - Rc[mux2,fork2] + Nc[mux2,fork2] >= 0
 ExtraConstr[fork2,extsi6]: - Rc[fork2,extsi6] + Nc[fork2,extsi6] >= 0
 ExtraConstr[fork2,extsi7]: - Rc[fork2,extsi7] + Nc[fork2,extsi7] >= 0
 ExtraConstr[fork2,extsi8]: - Rc[fork2,extsi8] + Nc[fork2,extsi8] >= 0
 ExtraConstr[extsi6,addi1]: - Rc[extsi6,addi1] + Nc[extsi6,addi1] >= 0
 ExtraConstr[extsi7,subi1]: - Rc[extsi7,subi1] + Nc[extsi7,subi1] >= 0
 ExtraConstr[extsi8,mc_load0_plin]: - Rc[extsi8,mc_load0_plin]
   + Nc[extsi8,mc_load0_plin] >= 0
 ExtraConstr[mux1,addi0]: - Rc[mux1,addi0] + Nc[mux1,addi0] >= 0
 ExtraConstr[control_merge2,fork3]: - Rc[control_merge2,fork3]
   + Nc[control_merge2,fork3] >= 0
 ExtraConstr[control_merge2,cond_br3]: - Rc[control_merge2,cond_br3]
   + Nc[control_merge2,cond_br3] >= 0
 ExtraConstr[fork3,mux2]: - Rc[fork3,mux2] + Nc[fork3,mux2] >= 0
 ExtraConstr[fork3,mux1]: - Rc[fork3,mux1] + Nc[fork3,mux1] >= 0
 ExtraConstr[source0,constant4]: - Rc[source0,constant4]
   + Nc[source0,constant4] >= 0
 ExtraConstr[constant4,extsi9]: - Rc[constant4,extsi9]
   + Nc[constant4,extsi9] >= 0
 ExtraConstr[extsi9,subi1]: - Rc[extsi9,subi1] + Nc[extsi9,subi1] >= 0
 ExtraConstr[source1,constant8]: - Rc[source1,constant8]
   + Nc[source1,constant8] >= 0
 ExtraConstr[constant8,extsi10]: - Rc[constant8,extsi10]
   + Nc[constant8,extsi10] >= 0
 ExtraConstr[extsi10,cmpi1]: - Rc[extsi10,cmpi1] + Nc[extsi10,cmpi1] >= 0
 ExtraConstr[source2,constant9]: - Rc[source2,constant9]
   + Nc[source2,constant9] >= 0
 ExtraConstr[constant9,extsi11]: - Rc[constant9,extsi11]
   + Nc[constant9,extsi11] >= 0
 ExtraConstr[extsi11,addi1]: - Rc[extsi11,addi1] + Nc[extsi11,addi1] >= 0
 ExtraConstr[mc_load0_plout,muli0_plin]: - Rc[mc_load0_plout,muli0_plin]
   + Nc[mc_load0_plout,muli0_plin] >= 0
 ExtraConstr[subi1,extsi12]: - Rc[subi1,extsi12] + Nc[subi1,extsi12] >= 0
 ExtraConstr[extsi12,mc_load1_plin]: - Rc[extsi12,mc_load1_plin]
   + Nc[extsi12,mc_load1_plin] >= 0
 ExtraConstr[mc_load1_plout,muli0_plin]: - Rc[mc_load1_plout,muli0_plin]
   + Nc[mc_load1_plout,muli0_plin] >= 0
 ExtraConstr[muli0_plout,addi0]: - Rc[muli0_plout,addi0]
   + Nc[muli0_plout,addi0] >= 0
 ExtraConstr[addi0,cond_br2]: - Rc[addi0,cond_br2] + Nc[addi0,cond_br2]
   >= 0
 ExtraConstr[addi1,fork4]: - Rc[addi1,fork4] + Nc[addi1,fork4] >= 0
 ExtraConstr[fork4,trunci0]: - Rc[fork4,trunci0] + Nc[fork4,trunci0] >= 0
 ExtraConstr[fork4,cmpi1]: - Rc[fork4,cmpi1] + Nc[fork4,cmpi1] >= 0
 ExtraConstr[trunci0,cond_br0]: - Rc[trunci0,cond_br0]
   + Nc[trunci0,cond_br0] >= 0
 ExtraConstr[cmpi1,fork5]: - Rc[cmpi1,fork5] + Nc[cmpi1,fork5] >= 0
 ExtraConstr[fork5,cond_br0]: - Rc[fork5,cond_br0] + Nc[fork5,cond_br0]
   >= 0
 ExtraConstr[fork5,cond_br2]: - Rc[fork5,cond_br2] + Nc[fork5,cond_br2]
   >= 0
 ExtraConstr[fork5,cond_br3]: - Rc[fork5,cond_br3] + Nc[fork5,cond_br3]
   >= 0
 ExtraConstr[cond_br0,mux2]: - Rc[cond_br0,mux2] + Nc[cond_br0,mux2] >= 0
 ExtraConstr[cond_br0,sink0]: - Rc[cond_br0,sink0] + Nc[cond_br0,sink0]
   >= 0
 ExtraConstr[cond_br2,mux1]: - Rc[cond_br2,mux1] + Nc[cond_br2,mux1] >= 0
 ExtraConstr[cond_br2,return1]: - Rc[cond_br2,return1]
   + Nc[cond_br2,return1] >= 0
 ExtraConstr[cond_br3,control_merge2]: - Rc[cond_br3,control_merge2]
   + Nc[cond_br3,control_merge2] >= 0
 ExtraConstr[cond_br3,sink1]: - Rc[cond_br3,sink1] + Nc[cond_br3,sink1]
   >= 0
 ExtraConstr[return1,end0]: - Rc[return1,end0] + Nc[return1,end0] >= 0
Bounds
 0.001 <= Theta[0] <= 1
Binaries
 Rc[start_0,fork0] Rc[fork0,constant1] Rc[fork0,control_merge2]
 Rc[constant1,fork1] Rc[fork1,extsi4] Rc[fork1,extsi5] Rc[extsi4,mux2]
 Rc[extsi5,mux1] Rc[mux2,fork2] Rc[fork2,extsi6] Rc[fork2,extsi7]
 Rc[fork2,extsi8] Rc[extsi6,addi1] Rc[extsi7,subi1]
 Rc[extsi8,mc_load0_plin] Rc[mux1,addi0] Rc[control_merge2,fork3]
 Rc[control_merge2,cond_br3] Rc[fork3,mux2] Rc[fork3,mux1]
 Rc[source0,constant4] Rc[constant4,extsi9] Rc[extsi9,subi1]
 Rc[source1,constant8] Rc[constant8,extsi10] Rc[extsi10,cmpi1]
 Rc[source2,constant9] Rc[constant9,extsi11] Rc[extsi11,addi1]
 Rc[mc_load0_plout,muli0_plin] Rc[subi1,extsi12] Rc[extsi12,mc_load1_plin]
 Rc[mc_load1_plout,muli0_plin] Rc[muli0_plout,addi0] Rc[addi0,cond_br2]
 Rc[addi1,fork4] Rc[fork4,trunci0] Rc[fork4,cmpi1] Rc[trunci0,cond_br0]
 Rc[cmpi1,fork5] Rc[fork5,cond_br0] Rc[fork5,cond_br2] Rc[fork5,cond_br3]
 Rc[cond_br0,mux2] Rc[cond_br0,sink0] Rc[cond_br2,mux1]
 Rc[cond_br2,return1] Rc[cond_br3,control_merge2] Rc[cond_br3,sink1]
 Rc[return1,end0]
Generals
 Nc[start_0,fork0] Nc[fork0,constant1] Nc[fork0,control_merge2]
 Nc[constant1,fork1] Nc[fork1,extsi4] Nc[fork1,extsi5] Nc[extsi4,mux2]
 Nc[extsi5,mux1] Nc[mux2,fork2] Nc[fork2,extsi6] Nc[fork2,extsi7]
 Nc[fork2,extsi8] Nc[extsi6,addi1] Nc[extsi7,subi1]
 Nc[extsi8,mc_load0_plin] Nc[mux1,addi0] Nc[control_merge2,fork3]
 Nc[control_merge2,cond_br3] Nc[fork3,mux2] Nc[fork3,mux1]
 Nc[source0,constant4] Nc[constant4,extsi9] Nc[extsi9,subi1]
 Nc[source1,constant8] Nc[constant8,extsi10] Nc[extsi10,cmpi1]
 Nc[source2,constant9] Nc[constant9,extsi11] Nc[extsi11,addi1]
 Nc[mc_load0_plout,muli0_plin] Nc[subi1,extsi12] Nc[extsi12,mc_load1_plin]
 Nc[mc_load1_plout,muli0_plin] Nc[muli0_plout,addi0] Nc[addi0,cond_br2]
 Nc[addi1,fork4] Nc[fork4,trunci0] Nc[fork4,cmpi1] Nc[trunci0,cond_br0]
 Nc[cmpi1,fork5] Nc[fork5,cond_br0] Nc[fork5,cond_br2] Nc[fork5,cond_br3]
 Nc[cond_br0,mux2] Nc[cond_br0,sink0] Nc[cond_br2,mux1]
 Nc[cond_br2,return1] Nc[cond_br3,control_merge2] Nc[cond_br3,sink1]
 Nc[return1,end0]
End
