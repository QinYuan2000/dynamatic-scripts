\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  - 1e-05 Nc[start_0,fork0] - 1e-05 Nc[fork0,constant1]
   - 1e-05 Nc[fork0,control_merge2] - 1e-05 Nc[constant1,fork1]
   - 1e-05 Nc[fork1,extsi4] - 1e-05 Nc[fork1,extsi5]
   - 1e-05 Nc[extsi4,mux2_plin] - 1e-05 Nc[extsi5,mux1_plin]
   - 1e-05 Nc[mux2_plout,fork2] - 1e-05 Nc[fork2,extsi6]
   - 1e-05 Nc[fork2,extsi7] - 1e-05 Nc[fork2,extsi8]
   - 1e-05 Nc[extsi6,addi1_plin] - 1e-05 Nc[extsi7,subi1_plin]
   - 1e-05 Nc[extsi8,mc_load0_plin] - 1e-05 Nc[mux1_plout,addi0_plin]
   - 1e-05 Nc[control_merge2,fork3] - 1e-05 Nc[control_merge2,cond_br3]
   - 1e-05 Nc[fork3,mux2_plin] - 1e-05 Nc[fork3,mux1_plin]
   - 1e-05 Nc[source0,constant4] - 1e-05 Nc[constant4,extsi9]
   - 1e-05 Nc[extsi9,subi1_plin] - 1e-05 Nc[source1,constant8]
   - 1e-05 Nc[constant8,extsi10] - 1e-05 Nc[extsi10,cmpi1_plin]
   - 1e-05 Nc[source2,constant9] - 1e-05 Nc[constant9,extsi11]
   - 1e-05 Nc[extsi11,addi1_plin] - 1e-05 Nc[mc_load0_plout,muli0_plin]
   - 1e-05 Nc[subi1_plout,extsi12] - 1e-05 Nc[extsi12,mc_load1_plin]
   - 1e-05 Nc[mc_load1_plout,muli0_plin] - 1e-05 Nc[muli0_plout,addi0_plin]
   - 1e-05 Nc[addi0_plout,cond_br2] - 1e-05 Nc[addi1_plout,fork4]
   - 1e-05 Nc[fork4,trunci0] - 1e-05 Nc[fork4,cmpi1_plin]
   - 1e-05 Nc[trunci0,cond_br0] - 1e-05 Nc[cmpi1_plout,fork5]
   - 1e-05 Nc[fork5,cond_br0] - 1e-05 Nc[fork5,cond_br2]
   - 1e-05 Nc[fork5,cond_br3] - 1e-05 Nc[cond_br0,mux2_plin]
   - 1e-05 Nc[cond_br0,sink0] - 1e-05 Nc[cond_br2,mux1_plin]
   - 1e-05 Nc[cond_br2,return1_plin] - 1e-05 Nc[cond_br3,control_merge2]
   - 1e-05 Nc[cond_br3,sink1] - 1e-05 Nc[return1_plout,end0_plin]
   + Theta[0]
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
 PathConstr1[extsi4,mux2_plin]: 100 Rc[extsi4,mux2_plin]
   - Tin[extsi4,mux2_plin] + Tout[extsi4,mux2_plin] >= 0
 PathConstr1[extsi5,mux1_plin]: 100 Rc[extsi5,mux1_plin]
   - Tin[extsi5,mux1_plin] + Tout[extsi5,mux1_plin] >= 0
 PathConstr1[mux2_plout,fork2]: 100 Rc[mux2_plout,fork2]
   - Tin[mux2_plout,fork2] + Tout[mux2_plout,fork2] >= 0
 PathConstr1[fork2,extsi6]: 100 Rc[fork2,extsi6] - Tin[fork2,extsi6]
   + Tout[fork2,extsi6] >= 0
 PathConstr1[fork2,extsi7]: 100 Rc[fork2,extsi7] - Tin[fork2,extsi7]
   + Tout[fork2,extsi7] >= 0
 PathConstr1[fork2,extsi8]: 100 Rc[fork2,extsi8] - Tin[fork2,extsi8]
   + Tout[fork2,extsi8] >= 0
 PathConstr1[extsi6,addi1_plin]: 100 Rc[extsi6,addi1_plin]
   - Tin[extsi6,addi1_plin] + Tout[extsi6,addi1_plin] >= 0
 PathConstr1[extsi7,subi1_plin]: 100 Rc[extsi7,subi1_plin]
   - Tin[extsi7,subi1_plin] + Tout[extsi7,subi1_plin] >= 0
 PathConstr1[extsi8,mc_load0_plin]: 100 Rc[extsi8,mc_load0_plin]
   - Tin[extsi8,mc_load0_plin] + Tout[extsi8,mc_load0_plin] >= 0
 PathConstr1[mux1_plout,addi0_plin]: 100 Rc[mux1_plout,addi0_plin]
   - Tin[mux1_plout,addi0_plin] + Tout[mux1_plout,addi0_plin] >= 0
 PathConstr1[control_merge2,fork3]: 100 Rc[control_merge2,fork3]
   - Tin[control_merge2,fork3] + Tout[control_merge2,fork3] >= 0
 PathConstr1[control_merge2,cond_br3]: 100 Rc[control_merge2,cond_br3]
   - Tin[control_merge2,cond_br3] + Tout[control_merge2,cond_br3] >= 0
 PathConstr1[fork3,mux2_plin]: 100 Rc[fork3,mux2_plin]
   - Tin[fork3,mux2_plin] + Tout[fork3,mux2_plin] >= 0
 PathConstr1[fork3,mux1_plin]: 100 Rc[fork3,mux1_plin]
   - Tin[fork3,mux1_plin] + Tout[fork3,mux1_plin] >= 0
 PathConstr1[source0,constant4]: 100 Rc[source0,constant4]
   - Tin[source0,constant4] + Tout[source0,constant4] >= 0
 PathConstr1[constant4,extsi9]: 100 Rc[constant4,extsi9]
   - Tin[constant4,extsi9] + Tout[constant4,extsi9] >= 0
 PathConstr1[extsi9,subi1_plin]: 100 Rc[extsi9,subi1_plin]
   - Tin[extsi9,subi1_plin] + Tout[extsi9,subi1_plin] >= 0
 PathConstr1[source1,constant8]: 100 Rc[source1,constant8]
   - Tin[source1,constant8] + Tout[source1,constant8] >= 0
 PathConstr1[constant8,extsi10]: 100 Rc[constant8,extsi10]
   - Tin[constant8,extsi10] + Tout[constant8,extsi10] >= 0
 PathConstr1[extsi10,cmpi1_plin]: 100 Rc[extsi10,cmpi1_plin]
   - Tin[extsi10,cmpi1_plin] + Tout[extsi10,cmpi1_plin] >= 0
 PathConstr1[source2,constant9]: 100 Rc[source2,constant9]
   - Tin[source2,constant9] + Tout[source2,constant9] >= 0
 PathConstr1[constant9,extsi11]: 100 Rc[constant9,extsi11]
   - Tin[constant9,extsi11] + Tout[constant9,extsi11] >= 0
 PathConstr1[extsi11,addi1_plin]: 100 Rc[extsi11,addi1_plin]
   - Tin[extsi11,addi1_plin] + Tout[extsi11,addi1_plin] >= 0
 PathConstr1[mc_load0_plout,muli0_plin]: 100 Rc[mc_load0_plout,muli0_plin]
   - Tin[mc_load0_plout,muli0_plin] + Tout[mc_load0_plout,muli0_plin] >= 0
 PathConstr1[subi1_plout,extsi12]: 100 Rc[subi1_plout,extsi12]
   - Tin[subi1_plout,extsi12] + Tout[subi1_plout,extsi12] >= 0
 PathConstr1[extsi12,mc_load1_plin]: 100 Rc[extsi12,mc_load1_plin]
   - Tin[extsi12,mc_load1_plin] + Tout[extsi12,mc_load1_plin] >= 0
 PathConstr1[mc_load1_plout,muli0_plin]: 100 Rc[mc_load1_plout,muli0_plin]
   - Tin[mc_load1_plout,muli0_plin] + Tout[mc_load1_plout,muli0_plin] >= 0
 PathConstr1[muli0_plout,addi0_plin]: 100 Rc[muli0_plout,addi0_plin]
   - Tin[muli0_plout,addi0_plin] + Tout[muli0_plout,addi0_plin] >= 0
 PathConstr1[addi0_plout,cond_br2]: 100 Rc[addi0_plout,cond_br2]
   - Tin[addi0_plout,cond_br2] + Tout[addi0_plout,cond_br2] >= 0
 PathConstr1[addi1_plout,fork4]: 100 Rc[addi1_plout,fork4]
   - Tin[addi1_plout,fork4] + Tout[addi1_plout,fork4] >= 0
 PathConstr1[fork4,trunci0]: 100 Rc[fork4,trunci0] - Tin[fork4,trunci0]
   + Tout[fork4,trunci0] >= 0
 PathConstr1[fork4,cmpi1_plin]: 100 Rc[fork4,cmpi1_plin]
   - Tin[fork4,cmpi1_plin] + Tout[fork4,cmpi1_plin] >= 0
 PathConstr1[trunci0,cond_br0]: 100 Rc[trunci0,cond_br0]
   - Tin[trunci0,cond_br0] + Tout[trunci0,cond_br0] >= 0
 PathConstr1[cmpi1_plout,fork5]: 100 Rc[cmpi1_plout,fork5]
   - Tin[cmpi1_plout,fork5] + Tout[cmpi1_plout,fork5] >= 0
 PathConstr1[fork5,cond_br0]: 100 Rc[fork5,cond_br0] - Tin[fork5,cond_br0]
   + Tout[fork5,cond_br0] >= 0
 PathConstr1[fork5,cond_br2]: 100 Rc[fork5,cond_br2] - Tin[fork5,cond_br2]
   + Tout[fork5,cond_br2] >= 0
 PathConstr1[fork5,cond_br3]: 100 Rc[fork5,cond_br3] - Tin[fork5,cond_br3]
   + Tout[fork5,cond_br3] >= 0
 PathConstr1[cond_br0,mux2_plin]: 100 Rc[cond_br0,mux2_plin]
   - Tin[cond_br0,mux2_plin] + Tout[cond_br0,mux2_plin] >= 0
 PathConstr1[cond_br0,sink0]: 100 Rc[cond_br0,sink0] - Tin[cond_br0,sink0]
   + Tout[cond_br0,sink0] >= 0
 PathConstr1[cond_br2,mux1_plin]: 100 Rc[cond_br2,mux1_plin]
   - Tin[cond_br2,mux1_plin] + Tout[cond_br2,mux1_plin] >= 0
 PathConstr1[cond_br2,return1_plin]: 100 Rc[cond_br2,return1_plin]
   - Tin[cond_br2,return1_plin] + Tout[cond_br2,return1_plin] >= 0
 PathConstr1[cond_br3,control_merge2]: 100 Rc[cond_br3,control_merge2]
   - Tin[cond_br3,control_merge2] + Tout[cond_br3,control_merge2] >= 0
 PathConstr1[cond_br3,sink1]: 100 Rc[cond_br3,sink1] - Tin[cond_br3,sink1]
   + Tout[cond_br3,sink1] >= 0
 PathConstr1[return1_plout,end0_plin]: 100 Rc[return1_plout,end0_plin]
   - Tin[return1_plout,end0_plin] + Tout[return1_plout,end0_plin] >= 0
 PathConstr1_pl[mux2_plin,mux2_plout]: 100 plRc[mux2]
   - Tin[mux2_plin,mux2_plout] + Tout[mux2_plin,mux2_plout] >= 0
 PathConstr1_pl[mux1_plin,mux1_plout]: 100 plRc[mux1]
   - Tin[mux1_plin,mux1_plout] + Tout[mux1_plin,mux1_plout] >= 0
 PathConstr1_pl[subi1_plin,subi1_plout]: 100 plRc[subi1]
   - Tin[subi1_plin,subi1_plout] + Tout[subi1_plin,subi1_plout] >= 0
 PathConstr1_pl[addi0_plin,addi0_plout]: 100 plRc[addi0]
   - Tin[addi0_plin,addi0_plout] + Tout[addi0_plin,addi0_plout] >= 0
 PathConstr1_pl[addi1_plin,addi1_plout]: 100 plRc[addi1]
   - Tin[addi1_plin,addi1_plout] + Tout[addi1_plin,addi1_plout] >= 0
 PathConstr1_pl[cmpi1_plin,cmpi1_plout]: 100 plRc[cmpi1]
   - Tin[cmpi1_plin,cmpi1_plout] + Tout[cmpi1_plin,cmpi1_plout] >= 0
 PathConstr1_pl[return1_plin,return1_plout]: 100 plRc[return1]
   - Tin[return1_plin,return1_plout] + Tout[return1_plin,return1_plout]
   >= 0
 PathConstr1_pl[end0_plin,end0_plout]: 100 plRc[end0]
   - Tin[end0_plin,end0_plout] + Tout[end0_plin,end0_plout] >= 0
 PathConstr2[start_0,fork0]: Tin[start_0,fork0] <= 4
 PathConstr2[fork0,constant1]: Tin[fork0,constant1] <= 4
 PathConstr2[fork0,control_merge2]: Tin[fork0,control_merge2] <= 4
 PathConstr2[constant1,fork1]: Tin[constant1,fork1] <= 4
 PathConstr2[fork1,extsi4]: Tin[fork1,extsi4] <= 4
 PathConstr2[fork1,extsi5]: Tin[fork1,extsi5] <= 4
 PathConstr2[extsi4,mux2_plin]: Tin[extsi4,mux2_plin] <= 4
 PathConstr2[extsi5,mux1_plin]: Tin[extsi5,mux1_plin] <= 4
 PathConstr2[mux2_plout,fork2]: Tin[mux2_plout,fork2] <= 4
 PathConstr2[fork2,extsi6]: Tin[fork2,extsi6] <= 4
 PathConstr2[fork2,extsi7]: Tin[fork2,extsi7] <= 4
 PathConstr2[fork2,extsi8]: Tin[fork2,extsi8] <= 4
 PathConstr2[extsi6,addi1_plin]: Tin[extsi6,addi1_plin] <= 4
 PathConstr2[extsi7,subi1_plin]: Tin[extsi7,subi1_plin] <= 4
 PathConstr2[extsi8,mc_load0_plin]: Tin[extsi8,mc_load0_plin] <= 4
 PathConstr2[mux1_plout,addi0_plin]: Tin[mux1_plout,addi0_plin] <= 4
 PathConstr2[control_merge2,fork3]: Tin[control_merge2,fork3] <= 4
 PathConstr2[control_merge2,cond_br3]: Tin[control_merge2,cond_br3] <= 4
 PathConstr2[fork3,mux2_plin]: Tin[fork3,mux2_plin] <= 4
 PathConstr2[fork3,mux1_plin]: Tin[fork3,mux1_plin] <= 4
 PathConstr2[source0,constant4]: Tin[source0,constant4] <= 4
 PathConstr2[constant4,extsi9]: Tin[constant4,extsi9] <= 4
 PathConstr2[extsi9,subi1_plin]: Tin[extsi9,subi1_plin] <= 4
 PathConstr2[source1,constant8]: Tin[source1,constant8] <= 4
 PathConstr2[constant8,extsi10]: Tin[constant8,extsi10] <= 4
 PathConstr2[extsi10,cmpi1_plin]: Tin[extsi10,cmpi1_plin] <= 4
 PathConstr2[source2,constant9]: Tin[source2,constant9] <= 4
 PathConstr2[constant9,extsi11]: Tin[constant9,extsi11] <= 4
 PathConstr2[extsi11,addi1_plin]: Tin[extsi11,addi1_plin] <= 4
 PathConstr2[mc_load0_plout,muli0_plin]: Tin[mc_load0_plout,muli0_plin]
   <= 4
 PathConstr2[subi1_plout,extsi12]: Tin[subi1_plout,extsi12] <= 4
 PathConstr2[extsi12,mc_load1_plin]: Tin[extsi12,mc_load1_plin] <= 4
 PathConstr2[mc_load1_plout,muli0_plin]: Tin[mc_load1_plout,muli0_plin]
   <= 4
 PathConstr2[muli0_plout,addi0_plin]: Tin[muli0_plout,addi0_plin] <= 4
 PathConstr2[addi0_plout,cond_br2]: Tin[addi0_plout,cond_br2] <= 4
 PathConstr2[addi1_plout,fork4]: Tin[addi1_plout,fork4] <= 4
 PathConstr2[fork4,trunci0]: Tin[fork4,trunci0] <= 4
 PathConstr2[fork4,cmpi1_plin]: Tin[fork4,cmpi1_plin] <= 4
 PathConstr2[trunci0,cond_br0]: Tin[trunci0,cond_br0] <= 4
 PathConstr2[cmpi1_plout,fork5]: Tin[cmpi1_plout,fork5] <= 4
 PathConstr2[fork5,cond_br0]: Tin[fork5,cond_br0] <= 4
 PathConstr2[fork5,cond_br2]: Tin[fork5,cond_br2] <= 4
 PathConstr2[fork5,cond_br3]: Tin[fork5,cond_br3] <= 4
 PathConstr2[cond_br0,mux2_plin]: Tin[cond_br0,mux2_plin] <= 4
 PathConstr2[cond_br0,sink0]: Tin[cond_br0,sink0] <= 4
 PathConstr2[cond_br2,mux1_plin]: Tin[cond_br2,mux1_plin] <= 4
 PathConstr2[cond_br2,return1_plin]: Tin[cond_br2,return1_plin] <= 4
 PathConstr2[cond_br3,control_merge2]: Tin[cond_br3,control_merge2] <= 4
 PathConstr2[cond_br3,sink1]: Tin[cond_br3,sink1] <= 4
 PathConstr2[return1_plout,end0_plin]: Tin[return1_plout,end0_plin] <= 4
 PathConstr2[mc_load0_plin,mc_load0_plout]:
   Tin[mc_load0_plin,mc_load0_plout] <= 4
 PathConstr2[mc_load1_plin,mc_load1_plout]:
   Tin[mc_load1_plin,mc_load1_plout] <= 4
 PathConstr2[muli0_plin,muli0_plout]: Tin[muli0_plin,muli0_plout] <= 4
 PathConstr2[mux2_plin,mux2_plout]: Tin[mux2_plin,mux2_plout] <= 4
 PathConstr2[mux1_plin,mux1_plout]: Tin[mux1_plin,mux1_plout] <= 4
 PathConstr2[subi1_plin,subi1_plout]: Tin[subi1_plin,subi1_plout] <= 4
 PathConstr2[addi0_plin,addi0_plout]: Tin[addi0_plin,addi0_plout] <= 4
 PathConstr2[addi1_plin,addi1_plout]: Tin[addi1_plin,addi1_plout] <= 4
 PathConstr2[cmpi1_plin,cmpi1_plout]: Tin[cmpi1_plin,cmpi1_plout] <= 4
 PathConstr2[return1_plin,return1_plout]: Tin[return1_plin,return1_plout]
   <= 4
 PathConstr2[end0_plin,end0_plout]: Tin[end0_plin,end0_plout] <= 4
 PathConstr3_nopl: Tin[fork0,constant1] - Tout[start_0,fork0] >= 0
 PathConstr3_nopl: Tin[fork0,control_merge2] - Tout[start_0,fork0] >= 0
 PathConstr3_nopl: Tin[constant1,fork1] - Tout[fork0,constant1] >= 0
 PathConstr3_nopl: Tin[fork1,extsi4] - Tout[constant1,fork1] >= 0
 PathConstr3_nopl: Tin[fork1,extsi5] - Tout[constant1,fork1] >= 0
 PathConstr3_nopl: Tin[extsi4,mux2_plin] - Tout[fork1,extsi4] >= 0
 PathConstr3_nopl: Tin[extsi5,mux1_plin] - Tout[fork1,extsi5] >= 0
 PathConstr3_nopl: Tin[fork2,extsi6] - Tout[mux2_plout,fork2] >= 0
 PathConstr3_nopl: Tin[fork2,extsi7] - Tout[mux2_plout,fork2] >= 0
 PathConstr3_nopl: Tin[fork2,extsi8] - Tout[mux2_plout,fork2] >= 0
 PathConstr3_nopl: Tin[extsi6,addi1_plin] - Tout[fork2,extsi6] >= 0
 PathConstr3_nopl: Tin[extsi7,subi1_plin] - Tout[fork2,extsi7] >= 0
 PathConstr3_nopl: Tin[extsi8,mc_load0_plin] - Tout[fork2,extsi8] >= 0
 PathConstr3_nopl: Tin[control_merge2,fork3] - Tout[fork0,control_merge2]
   >= 0
 PathConstr3_nopl: Tin[control_merge2,cond_br3]
   - Tout[fork0,control_merge2] >= 0
 PathConstr3_nopl: Tin[control_merge2,fork3]
   - Tout[cond_br3,control_merge2] >= 0
 PathConstr3_nopl: Tin[control_merge2,cond_br3]
   - Tout[cond_br3,control_merge2] >= 0
 PathConstr3_nopl: Tin[fork3,mux2_plin] - Tout[control_merge2,fork3] >= 0
 PathConstr3_nopl: Tin[fork3,mux1_plin] - Tout[control_merge2,fork3] >= 0
 PathConstr3_nopl: Tin[constant4,extsi9] - Tout[source0,constant4] >= 0
 PathConstr3_nopl: Tin[extsi9,subi1_plin] - Tout[constant4,extsi9] >= 0
 PathConstr3_nopl: Tin[constant8,extsi10] - Tout[source1,constant8] >= 0
 PathConstr3_nopl: Tin[extsi10,cmpi1_plin] - Tout[constant8,extsi10] >= 0
 PathConstr3_nopl: Tin[constant9,extsi11] - Tout[source2,constant9] >= 0
 PathConstr3_nopl: Tin[extsi11,addi1_plin] - Tout[constant9,extsi11] >= 0
 PathConstr3_nopl: Tin[extsi12,mc_load1_plin] - Tout[subi1_plout,extsi12]
   >= 0
 PathConstr3_nopl: Tin[fork4,trunci0] - Tout[addi1_plout,fork4] >= 0
 PathConstr3_nopl: Tin[fork4,cmpi1_plin] - Tout[addi1_plout,fork4] >= 0
 PathConstr3_nopl: Tin[trunci0,cond_br0] - Tout[fork4,trunci0] >= 0
 PathConstr3_nopl: Tin[fork5,cond_br0] - Tout[cmpi1_plout,fork5] >= 0
 PathConstr3_nopl: Tin[fork5,cond_br2] - Tout[cmpi1_plout,fork5] >= 0
 PathConstr3_nopl: Tin[fork5,cond_br3] - Tout[cmpi1_plout,fork5] >= 0
 PathConstr3_nopl: Tin[cond_br0,mux2_plin] - Tout[trunci0,cond_br0] >= 0
 PathConstr3_nopl: Tin[cond_br0,sink0] - Tout[trunci0,cond_br0] >= 0
 PathConstr3_nopl: Tin[cond_br0,mux2_plin] - Tout[fork5,cond_br0] >= 0
 PathConstr3_nopl: Tin[cond_br0,sink0] - Tout[fork5,cond_br0] >= 0
 PathConstr3_nopl: Tin[cond_br2,mux1_plin] - Tout[addi0_plout,cond_br2]
   >= 0
 PathConstr3_nopl: Tin[cond_br2,return1_plin] - Tout[addi0_plout,cond_br2]
   >= 0
 PathConstr3_nopl: Tin[cond_br2,mux1_plin] - Tout[fork5,cond_br2] >= 0
 PathConstr3_nopl: Tin[cond_br2,return1_plin] - Tout[fork5,cond_br2] >= 0
 PathConstr3_nopl: Tin[cond_br3,control_merge2]
   - Tout[control_merge2,cond_br3] >= 0
 PathConstr3_nopl: Tin[cond_br3,sink1] - Tout[control_merge2,cond_br3]
   >= 0
 PathConstr3_nopl: Tin[cond_br3,control_merge2] - Tout[fork5,cond_br3]
   >= 0
 PathConstr3_nopl: Tin[cond_br3,sink1] - Tout[fork5,cond_br3] >= 0
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
 PathConstr3_conpl: Tin[muli0_plout,addi0_plin]
   - Tout[muli0_plin,muli0_plout] >= 0
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
 ThroughputConstr1[extsi4,mux2_plin]: Theta_1[extsi4,mux2_plin]
   + ru[extsi4] - ru[mux2_plin] = 0
 ThroughputConstr1[extsi5,mux1_plin]: Theta_1[extsi5,mux1_plin]
   + ru[extsi5] - ru[mux1_plin] = 0
 ThroughputConstr1[mux2_plout,fork2]: Theta_1[mux2_plout,fork2]
   + ru[mux2_plout] - ru[fork2] = 0
 ThroughputConstr1[fork2,extsi6]: Theta_1[fork2,extsi6] + ru[fork2]
   - ru[extsi6] = 0
 ThroughputConstr1[fork2,extsi7]: Theta_1[fork2,extsi7] + ru[fork2]
   - ru[extsi7] = 0
 ThroughputConstr1[fork2,extsi8]: Theta_1[fork2,extsi8] + ru[fork2]
   - ru[extsi8] = 0
 ThroughputConstr1[extsi6,addi1_plin]: Theta_1[extsi6,addi1_plin]
   + ru[extsi6] - ru[addi1_plin] = 0
 ThroughputConstr1[extsi7,subi1_plin]: Theta_1[extsi7,subi1_plin]
   + ru[extsi7] - ru[subi1_plin] = 0
 ThroughputConstr1[extsi8,mc_load0_plin]: Theta_1[extsi8,mc_load0_plin]
   + ru[extsi8] - ru[mc_load0_plin] = 0
 ThroughputConstr1[mux1_plout,addi0_plin]: Theta_1[mux1_plout,addi0_plin]
   + ru[mux1_plout] - ru[addi0_plin] = 0
 ThroughputConstr1[control_merge2,fork3]: Theta_1[control_merge2,fork3]
   + ru[control_merge2] - ru[fork3] = 0
 ThroughputConstr1[control_merge2,cond_br3]:
   Theta_1[control_merge2,cond_br3] + ru[control_merge2] - ru[cond_br3]
   = 0
 ThroughputConstr1[fork3,mux2_plin]: Theta_1[fork3,mux2_plin]
   - ru[mux2_plin] + ru[fork3] = 0
 ThroughputConstr1[fork3,mux1_plin]: Theta_1[fork3,mux1_plin]
   - ru[mux1_plin] + ru[fork3] = 0
 ThroughputConstr1[source0,constant4]: Theta_1[source0,constant4]
   + ru[source0] - ru[constant4] = 0
 ThroughputConstr1[constant4,extsi9]: Theta_1[constant4,extsi9]
   + ru[constant4] - ru[extsi9] = 0
 ThroughputConstr1[extsi9,subi1_plin]: Theta_1[extsi9,subi1_plin]
   + ru[extsi9] - ru[subi1_plin] = 0
 ThroughputConstr1[source1,constant8]: Theta_1[source1,constant8]
   + ru[source1] - ru[constant8] = 0
 ThroughputConstr1[constant8,extsi10]: Theta_1[constant8,extsi10]
   + ru[constant8] - ru[extsi10] = 0
 ThroughputConstr1[extsi10,cmpi1_plin]: Theta_1[extsi10,cmpi1_plin]
   + ru[extsi10] - ru[cmpi1_plin] = 0
 ThroughputConstr1[source2,constant9]: Theta_1[source2,constant9]
   + ru[source2] - ru[constant9] = 0
 ThroughputConstr1[constant9,extsi11]: Theta_1[constant9,extsi11]
   + ru[constant9] - ru[extsi11] = 0
 ThroughputConstr1[extsi11,addi1_plin]: Theta_1[extsi11,addi1_plin]
   + ru[extsi11] - ru[addi1_plin] = 0
 ThroughputConstr1[mc_load0_plout,muli0_plin]:
   Theta_1[mc_load0_plout,muli0_plin] + ru[mc_load0_plout] - ru[muli0_plin]
   = 0
 ThroughputConstr1[subi1_plout,extsi12]: Theta_1[subi1_plout,extsi12]
   + ru[subi1_plout] - ru[extsi12] = 0
 ThroughputConstr1[extsi12,mc_load1_plin]: Theta_1[extsi12,mc_load1_plin]
   + ru[extsi12] - ru[mc_load1_plin] = 0
 ThroughputConstr1[mc_load1_plout,muli0_plin]:
   Theta_1[mc_load1_plout,muli0_plin] + ru[mc_load1_plout] - ru[muli0_plin]
   = 0
 ThroughputConstr1[muli0_plout,addi0_plin]: Theta_1[muli0_plout,addi0_plin]
   + ru[muli0_plout] - ru[addi0_plin] = 0
 ThroughputConstr1[addi0_plout,cond_br2]: Theta_1[addi0_plout,cond_br2]
   + ru[addi0_plout] - ru[cond_br2] = 0
 ThroughputConstr1[addi1_plout,fork4]: Theta_1[addi1_plout,fork4]
   + ru[addi1_plout] - ru[fork4] = 0
 ThroughputConstr1[fork4,trunci0]: Theta_1[fork4,trunci0] + ru[fork4]
   - ru[trunci0] = 0
 ThroughputConstr1[fork4,cmpi1_plin]: Theta_1[fork4,cmpi1_plin] + ru[fork4]
   - ru[cmpi1_plin] = 0
 ThroughputConstr1[trunci0,cond_br0]: Theta_1[trunci0,cond_br0]
   + ru[trunci0] - ru[cond_br0] = 0
 ThroughputConstr1[cmpi1_plout,fork5]: Theta_1[cmpi1_plout,fork5]
   + ru[cmpi1_plout] - ru[fork5] = 0
 ThroughputConstr1[fork5,cond_br0]: Theta_1[fork5,cond_br0] + ru[fork5]
   - ru[cond_br0] = 0
 ThroughputConstr1[fork5,cond_br2]: Theta_1[fork5,cond_br2] + ru[fork5]
   - ru[cond_br2] = 0
 ThroughputConstr1[fork5,cond_br3]: Theta_1[fork5,cond_br3] + ru[fork5]
   - ru[cond_br3] = 0
 ThroughputConstr1[cond_br0,mux2_plin]: Theta_1[cond_br0,mux2_plin]
   - ru[mux2_plin] + ru[cond_br0] = 1
 ThroughputConstr1[cond_br0,sink0]: Theta_1[cond_br0,sink0] + ru[cond_br0]
   - ru[sink0] = 0
 ThroughputConstr1[cond_br2,mux1_plin]: Theta_1[cond_br2,mux1_plin]
   - ru[mux1_plin] + ru[cond_br2] = 1
 ThroughputConstr1[cond_br2,return1_plin]: Theta_1[cond_br2,return1_plin]
   + ru[cond_br2] - ru[return1_plin] = 0
 ThroughputConstr1[cond_br3,control_merge2]:
   Theta_1[cond_br3,control_merge2] - ru[control_merge2] + ru[cond_br3]
   = 1
 ThroughputConstr1[cond_br3,sink1]: Theta_1[cond_br3,sink1] + ru[cond_br3]
   - ru[sink1] = 0
 ThroughputConstr1[return1_plout,end0_plin]:
   Theta_1[return1_plout,end0_plin] + ru[return1_plout] - ru[end0_plin]
   = 0
 ThroughputConstr1[mc_load0_plin,mc_load0_plout]:
   Theta_1[mc_load0_plin,mc_load0_plout] + ru[mc_load0_plin]
   - ru[mc_load0_plout] = 0
 ThroughputConstr1[mc_load1_plin,mc_load1_plout]:
   Theta_1[mc_load1_plin,mc_load1_plout] + ru[mc_load1_plin]
   - ru[mc_load1_plout] = 0
 ThroughputConstr1[muli0_plin,muli0_plout]: Theta_1[muli0_plin,muli0_plout]
   + ru[muli0_plin] - ru[muli0_plout] = 0
 ThroughputConstr1[mux2_plin,mux2_plout]: Theta_1[mux2_plin,mux2_plout]
   + ru[mux2_plin] - ru[mux2_plout] = 0
 ThroughputConstr1[mux1_plin,mux1_plout]: Theta_1[mux1_plin,mux1_plout]
   + ru[mux1_plin] - ru[mux1_plout] = 0
 ThroughputConstr1[subi1_plin,subi1_plout]: Theta_1[subi1_plin,subi1_plout]
   + ru[subi1_plin] - ru[subi1_plout] = 0
 ThroughputConstr1[addi0_plin,addi0_plout]: Theta_1[addi0_plin,addi0_plout]
   + ru[addi0_plin] - ru[addi0_plout] = 0
 ThroughputConstr1[addi1_plin,addi1_plout]: Theta_1[addi1_plin,addi1_plout]
   + ru[addi1_plin] - ru[addi1_plout] = 0
 ThroughputConstr1[cmpi1_plin,cmpi1_plout]: Theta_1[cmpi1_plin,cmpi1_plout]
   + ru[cmpi1_plin] - ru[cmpi1_plout] = 0
 ThroughputConstr1[return1_plin,return1_plout]:
   Theta_1[return1_plin,return1_plout] + ru[return1_plin]
   - ru[return1_plout] = 0
 ThroughputConstr1[end0_plin,end0_plout]: Theta_1[end0_plin,end0_plout]
   + ru[end0_plin] - ru[end0_plout] = 0
 ThroughputConstr2_nopl: Rc[mux2_plout,fork2] + Theta[0]
   - Theta_1[mux2_plout,fork2] <= 1
 ThroughputConstr2_nopl: Rc[fork2,extsi6] + Theta[0]
   - Theta_1[fork2,extsi6] <= 1
 ThroughputConstr2_nopl: Rc[fork2,extsi7] + Theta[0]
   - Theta_1[fork2,extsi7] <= 1
 ThroughputConstr2_nopl: Rc[fork2,extsi8] + Theta[0]
   - Theta_1[fork2,extsi8] <= 1
 ThroughputConstr2_nopl: Rc[extsi6,addi1_plin] + Theta[0]
   - Theta_1[extsi6,addi1_plin] <= 1
 ThroughputConstr2_nopl: Rc[extsi7,subi1_plin] + Theta[0]
   - Theta_1[extsi7,subi1_plin] <= 1
 ThroughputConstr2_nopl: Rc[extsi8,mc_load0_plin] + Theta[0]
   - Theta_1[extsi8,mc_load0_plin] <= 1
 ThroughputConstr2_nopl: Rc[mux1_plout,addi0_plin] + Theta[0]
   - Theta_1[mux1_plout,addi0_plin] <= 1
 ThroughputConstr2_nopl: Rc[control_merge2,fork3] + Theta[0]
   - Theta_1[control_merge2,fork3] <= 1
 ThroughputConstr2_nopl: Rc[control_merge2,cond_br3] + Theta[0]
   - Theta_1[control_merge2,cond_br3] <= 1
 ThroughputConstr2_nopl: Rc[fork3,mux2_plin] + Theta[0]
   - Theta_1[fork3,mux2_plin] <= 1
 ThroughputConstr2_nopl: Rc[fork3,mux1_plin] + Theta[0]
   - Theta_1[fork3,mux1_plin] <= 1
 ThroughputConstr2_nopl: Rc[source0,constant4] + Theta[0]
   - Theta_1[source0,constant4] <= 1
 ThroughputConstr2_nopl: Rc[constant4,extsi9] + Theta[0]
   - Theta_1[constant4,extsi9] <= 1
 ThroughputConstr2_nopl: Rc[extsi9,subi1_plin] + Theta[0]
   - Theta_1[extsi9,subi1_plin] <= 1
 ThroughputConstr2_nopl: Rc[source1,constant8] + Theta[0]
   - Theta_1[source1,constant8] <= 1
 ThroughputConstr2_nopl: Rc[constant8,extsi10] + Theta[0]
   - Theta_1[constant8,extsi10] <= 1
 ThroughputConstr2_nopl: Rc[extsi10,cmpi1_plin] + Theta[0]
   - Theta_1[extsi10,cmpi1_plin] <= 1
 ThroughputConstr2_nopl: Rc[source2,constant9] + Theta[0]
   - Theta_1[source2,constant9] <= 1
 ThroughputConstr2_nopl: Rc[constant9,extsi11] + Theta[0]
   - Theta_1[constant9,extsi11] <= 1
 ThroughputConstr2_nopl: Rc[extsi11,addi1_plin] + Theta[0]
   - Theta_1[extsi11,addi1_plin] <= 1
 ThroughputConstr2_nopl: Rc[mc_load0_plout,muli0_plin] + Theta[0]
   - Theta_1[mc_load0_plout,muli0_plin] <= 1
 ThroughputConstr2_nopl: Rc[subi1_plout,extsi12] + Theta[0]
   - Theta_1[subi1_plout,extsi12] <= 1
 ThroughputConstr2_nopl: Rc[extsi12,mc_load1_plin] + Theta[0]
   - Theta_1[extsi12,mc_load1_plin] <= 1
 ThroughputConstr2_nopl: Rc[mc_load1_plout,muli0_plin] + Theta[0]
   - Theta_1[mc_load1_plout,muli0_plin] <= 1
 ThroughputConstr2_nopl: Rc[muli0_plout,addi0_plin] + Theta[0]
   - Theta_1[muli0_plout,addi0_plin] <= 1
 ThroughputConstr2_nopl: Rc[addi0_plout,cond_br2] + Theta[0]
   - Theta_1[addi0_plout,cond_br2] <= 1
 ThroughputConstr2_nopl: Rc[addi1_plout,fork4] + Theta[0]
   - Theta_1[addi1_plout,fork4] <= 1
 ThroughputConstr2_nopl: Rc[fork4,trunci0] + Theta[0]
   - Theta_1[fork4,trunci0] <= 1
 ThroughputConstr2_nopl: Rc[fork4,cmpi1_plin] + Theta[0]
   - Theta_1[fork4,cmpi1_plin] <= 1
 ThroughputConstr2_nopl: Rc[trunci0,cond_br0] + Theta[0]
   - Theta_1[trunci0,cond_br0] <= 1
 ThroughputConstr2_nopl: Rc[cmpi1_plout,fork5] + Theta[0]
   - Theta_1[cmpi1_plout,fork5] <= 1
 ThroughputConstr2_nopl: Rc[fork5,cond_br0] + Theta[0]
   - Theta_1[fork5,cond_br0] <= 1
 ThroughputConstr2_nopl: Rc[fork5,cond_br2] + Theta[0]
   - Theta_1[fork5,cond_br2] <= 1
 ThroughputConstr2_nopl: Rc[fork5,cond_br3] + Theta[0]
   - Theta_1[fork5,cond_br3] <= 1
 ThroughputConstr2_nopl: Rc[cond_br0,mux2_plin] + Theta[0]
   - Theta_1[cond_br0,mux2_plin] <= 1
 ThroughputConstr2_nopl: Rc[cond_br2,mux1_plin] + Theta[0]
   - Theta_1[cond_br2,mux1_plin] <= 1
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
 SizingConstr1[extsi4,mux2_plin]: Nc[extsi4,mux2_plin]
   - Theta_1[extsi4,mux2_plin] - Theta_0[extsi4,mux2_plin] = 0
 SizingConstr1[extsi5,mux1_plin]: Nc[extsi5,mux1_plin]
   - Theta_1[extsi5,mux1_plin] - Theta_0[extsi5,mux1_plin] = 0
 SizingConstr1[mux2_plout,fork2]: Nc[mux2_plout,fork2]
   - Theta_1[mux2_plout,fork2] - Theta_0[mux2_plout,fork2] = 0
 SizingConstr1[fork2,extsi6]: Nc[fork2,extsi6] - Theta_1[fork2,extsi6]
   - Theta_0[fork2,extsi6] = 0
 SizingConstr1[fork2,extsi7]: Nc[fork2,extsi7] - Theta_1[fork2,extsi7]
   - Theta_0[fork2,extsi7] = 0
 SizingConstr1[fork2,extsi8]: Nc[fork2,extsi8] - Theta_1[fork2,extsi8]
   - Theta_0[fork2,extsi8] = 0
 SizingConstr1[extsi6,addi1_plin]: Nc[extsi6,addi1_plin]
   - Theta_1[extsi6,addi1_plin] - Theta_0[extsi6,addi1_plin] = 0
 SizingConstr1[extsi7,subi1_plin]: Nc[extsi7,subi1_plin]
   - Theta_1[extsi7,subi1_plin] - Theta_0[extsi7,subi1_plin] = 0
 SizingConstr1[extsi8,mc_load0_plin]: Nc[extsi8,mc_load0_plin]
   - Theta_1[extsi8,mc_load0_plin] - Theta_0[extsi8,mc_load0_plin] = 0
 SizingConstr1[mux1_plout,addi0_plin]: Nc[mux1_plout,addi0_plin]
   - Theta_1[mux1_plout,addi0_plin] - Theta_0[mux1_plout,addi0_plin] = 0
 SizingConstr1[control_merge2,fork3]: Nc[control_merge2,fork3]
   - Theta_1[control_merge2,fork3] - Theta_0[control_merge2,fork3] = 0
 SizingConstr1[control_merge2,cond_br3]: Nc[control_merge2,cond_br3]
   - Theta_1[control_merge2,cond_br3] - Theta_0[control_merge2,cond_br3]
   = 0
 SizingConstr1[fork3,mux2_plin]: Nc[fork3,mux2_plin]
   - Theta_1[fork3,mux2_plin] - Theta_0[fork3,mux2_plin] = 0
 SizingConstr1[fork3,mux1_plin]: Nc[fork3,mux1_plin]
   - Theta_1[fork3,mux1_plin] - Theta_0[fork3,mux1_plin] = 0
 SizingConstr1[source0,constant4]: Nc[source0,constant4]
   - Theta_1[source0,constant4] - Theta_0[source0,constant4] = 0
 SizingConstr1[constant4,extsi9]: Nc[constant4,extsi9]
   - Theta_1[constant4,extsi9] - Theta_0[constant4,extsi9] = 0
 SizingConstr1[extsi9,subi1_plin]: Nc[extsi9,subi1_plin]
   - Theta_1[extsi9,subi1_plin] - Theta_0[extsi9,subi1_plin] = 0
 SizingConstr1[source1,constant8]: Nc[source1,constant8]
   - Theta_1[source1,constant8] - Theta_0[source1,constant8] = 0
 SizingConstr1[constant8,extsi10]: Nc[constant8,extsi10]
   - Theta_1[constant8,extsi10] - Theta_0[constant8,extsi10] = 0
 SizingConstr1[extsi10,cmpi1_plin]: Nc[extsi10,cmpi1_plin]
   - Theta_1[extsi10,cmpi1_plin] - Theta_0[extsi10,cmpi1_plin] = 0
 SizingConstr1[source2,constant9]: Nc[source2,constant9]
   - Theta_1[source2,constant9] - Theta_0[source2,constant9] = 0
 SizingConstr1[constant9,extsi11]: Nc[constant9,extsi11]
   - Theta_1[constant9,extsi11] - Theta_0[constant9,extsi11] = 0
 SizingConstr1[extsi11,addi1_plin]: Nc[extsi11,addi1_plin]
   - Theta_1[extsi11,addi1_plin] - Theta_0[extsi11,addi1_plin] = 0
 SizingConstr1[mc_load0_plout,muli0_plin]: Nc[mc_load0_plout,muli0_plin]
   - Theta_1[mc_load0_plout,muli0_plin]
   - Theta_0[mc_load0_plout,muli0_plin] = 0
 SizingConstr1[subi1_plout,extsi12]: Nc[subi1_plout,extsi12]
   - Theta_1[subi1_plout,extsi12] - Theta_0[subi1_plout,extsi12] = 0
 SizingConstr1[extsi12,mc_load1_plin]: Nc[extsi12,mc_load1_plin]
   - Theta_1[extsi12,mc_load1_plin] - Theta_0[extsi12,mc_load1_plin] = 0
 SizingConstr1[mc_load1_plout,muli0_plin]: Nc[mc_load1_plout,muli0_plin]
   - Theta_1[mc_load1_plout,muli0_plin]
   - Theta_0[mc_load1_plout,muli0_plin] = 0
 SizingConstr1[muli0_plout,addi0_plin]: Nc[muli0_plout,addi0_plin]
   - Theta_1[muli0_plout,addi0_plin] - Theta_0[muli0_plout,addi0_plin] = 0
 SizingConstr1[addi0_plout,cond_br2]: Nc[addi0_plout,cond_br2]
   - Theta_1[addi0_plout,cond_br2] - Theta_0[addi0_plout,cond_br2] = 0
 SizingConstr1[addi1_plout,fork4]: Nc[addi1_plout,fork4]
   - Theta_1[addi1_plout,fork4] - Theta_0[addi1_plout,fork4] = 0
 SizingConstr1[fork4,trunci0]: Nc[fork4,trunci0] - Theta_1[fork4,trunci0]
   - Theta_0[fork4,trunci0] = 0
 SizingConstr1[fork4,cmpi1_plin]: Nc[fork4,cmpi1_plin]
   - Theta_1[fork4,cmpi1_plin] - Theta_0[fork4,cmpi1_plin] = 0
 SizingConstr1[trunci0,cond_br0]: Nc[trunci0,cond_br0]
   - Theta_1[trunci0,cond_br0] - Theta_0[trunci0,cond_br0] = 0
 SizingConstr1[cmpi1_plout,fork5]: Nc[cmpi1_plout,fork5]
   - Theta_1[cmpi1_plout,fork5] - Theta_0[cmpi1_plout,fork5] = 0
 SizingConstr1[fork5,cond_br0]: Nc[fork5,cond_br0]
   - Theta_1[fork5,cond_br0] - Theta_0[fork5,cond_br0] = 0
 SizingConstr1[fork5,cond_br2]: Nc[fork5,cond_br2]
   - Theta_1[fork5,cond_br2] - Theta_0[fork5,cond_br2] = 0
 SizingConstr1[fork5,cond_br3]: Nc[fork5,cond_br3]
   - Theta_1[fork5,cond_br3] - Theta_0[fork5,cond_br3] = 0
 SizingConstr1[cond_br0,mux2_plin]: Nc[cond_br0,mux2_plin]
   - Theta_1[cond_br0,mux2_plin] - Theta_0[cond_br0,mux2_plin] = 0
 SizingConstr1[cond_br0,sink0]: Nc[cond_br0,sink0]
   - Theta_1[cond_br0,sink0] - Theta_0[cond_br0,sink0] = 0
 SizingConstr1[cond_br2,mux1_plin]: Nc[cond_br2,mux1_plin]
   - Theta_1[cond_br2,mux1_plin] - Theta_0[cond_br2,mux1_plin] = 0
 SizingConstr1[cond_br2,return1_plin]: Nc[cond_br2,return1_plin]
   - Theta_1[cond_br2,return1_plin] - Theta_0[cond_br2,return1_plin] = 0
 SizingConstr1[cond_br3,control_merge2]: Nc[cond_br3,control_merge2]
   - Theta_1[cond_br3,control_merge2] - Theta_0[cond_br3,control_merge2]
   = 0
 SizingConstr1[cond_br3,sink1]: Nc[cond_br3,sink1]
   - Theta_1[cond_br3,sink1] - Theta_0[cond_br3,sink1] = 0
 SizingConstr1[return1_plout,end0_plin]: Nc[return1_plout,end0_plin]
   - Theta_1[return1_plout,end0_plin] - Theta_0[return1_plout,end0_plin]
   = 0
 SizingConstr2_nopl: Rc[mux2_plout,fork2] + Theta[0]
   - Theta_0[mux2_plout,fork2] <= 1
 SizingConstr2_nopl: Rc[fork2,extsi6] + Theta[0] - Theta_0[fork2,extsi6]
   <= 1
 SizingConstr2_nopl: Rc[fork2,extsi7] + Theta[0] - Theta_0[fork2,extsi7]
   <= 1
 SizingConstr2_nopl: Rc[fork2,extsi8] + Theta[0] - Theta_0[fork2,extsi8]
   <= 1
 SizingConstr2_nopl: Rc[extsi6,addi1_plin] + Theta[0]
   - Theta_0[extsi6,addi1_plin] <= 1
 SizingConstr2_nopl: Rc[extsi7,subi1_plin] + Theta[0]
   - Theta_0[extsi7,subi1_plin] <= 1
 SizingConstr2_nopl: Rc[extsi8,mc_load0_plin] + Theta[0]
   - Theta_0[extsi8,mc_load0_plin] <= 1
 SizingConstr2_nopl: Rc[mux1_plout,addi0_plin] + Theta[0]
   - Theta_0[mux1_plout,addi0_plin] <= 1
 SizingConstr2_nopl: Rc[control_merge2,fork3] + Theta[0]
   - Theta_0[control_merge2,fork3] <= 1
 SizingConstr2_nopl: Rc[control_merge2,cond_br3] + Theta[0]
   - Theta_0[control_merge2,cond_br3] <= 1
 SizingConstr2_nopl: Rc[fork3,mux2_plin] + Theta[0]
   - Theta_0[fork3,mux2_plin] <= 1
 SizingConstr2_nopl: Rc[fork3,mux1_plin] + Theta[0]
   - Theta_0[fork3,mux1_plin] <= 1
 SizingConstr2_nopl: Rc[source0,constant4] + Theta[0]
   - Theta_0[source0,constant4] <= 1
 SizingConstr2_nopl: Rc[constant4,extsi9] + Theta[0]
   - Theta_0[constant4,extsi9] <= 1
 SizingConstr2_nopl: Rc[extsi9,subi1_plin] + Theta[0]
   - Theta_0[extsi9,subi1_plin] <= 1
 SizingConstr2_nopl: Rc[source1,constant8] + Theta[0]
   - Theta_0[source1,constant8] <= 1
 SizingConstr2_nopl: Rc[constant8,extsi10] + Theta[0]
   - Theta_0[constant8,extsi10] <= 1
 SizingConstr2_nopl: Rc[extsi10,cmpi1_plin] + Theta[0]
   - Theta_0[extsi10,cmpi1_plin] <= 1
 SizingConstr2_nopl: Rc[source2,constant9] + Theta[0]
   - Theta_0[source2,constant9] <= 1
 SizingConstr2_nopl: Rc[constant9,extsi11] + Theta[0]
   - Theta_0[constant9,extsi11] <= 1
 SizingConstr2_nopl: Rc[extsi11,addi1_plin] + Theta[0]
   - Theta_0[extsi11,addi1_plin] <= 1
 SizingConstr2_nopl: Rc[mc_load0_plout,muli0_plin] + Theta[0]
   - Theta_0[mc_load0_plout,muli0_plin] <= 1
 SizingConstr2_nopl: Rc[subi1_plout,extsi12] + Theta[0]
   - Theta_0[subi1_plout,extsi12] <= 1
 SizingConstr2_nopl: Rc[extsi12,mc_load1_plin] + Theta[0]
   - Theta_0[extsi12,mc_load1_plin] <= 1
 SizingConstr2_nopl: Rc[mc_load1_plout,muli0_plin] + Theta[0]
   - Theta_0[mc_load1_plout,muli0_plin] <= 1
 SizingConstr2_nopl: Rc[muli0_plout,addi0_plin] + Theta[0]
   - Theta_0[muli0_plout,addi0_plin] <= 1
 SizingConstr2_nopl: Rc[addi0_plout,cond_br2] + Theta[0]
   - Theta_0[addi0_plout,cond_br2] <= 1
 SizingConstr2_nopl: Rc[addi1_plout,fork4] + Theta[0]
   - Theta_0[addi1_plout,fork4] <= 1
 SizingConstr2_nopl: Rc[fork4,trunci0] + Theta[0] - Theta_0[fork4,trunci0]
   <= 1
 SizingConstr2_nopl: Rc[fork4,cmpi1_plin] + Theta[0]
   - Theta_0[fork4,cmpi1_plin] <= 1
 SizingConstr2_nopl: Rc[trunci0,cond_br0] + Theta[0]
   - Theta_0[trunci0,cond_br0] <= 1
 SizingConstr2_nopl: Rc[cmpi1_plout,fork5] + Theta[0]
   - Theta_0[cmpi1_plout,fork5] <= 1
 SizingConstr2_nopl: Rc[fork5,cond_br0] + Theta[0]
   - Theta_0[fork5,cond_br0] <= 1
 SizingConstr2_nopl: Rc[fork5,cond_br2] + Theta[0]
   - Theta_0[fork5,cond_br2] <= 1
 SizingConstr2_nopl: Rc[fork5,cond_br3] + Theta[0]
   - Theta_0[fork5,cond_br3] <= 1
 SizingConstr2_nopl: Rc[cond_br0,mux2_plin] + Theta[0]
   - Theta_0[cond_br0,mux2_plin] <= 1
 SizingConstr2_nopl: Rc[cond_br2,mux1_plin] + Theta[0]
   - Theta_0[cond_br2,mux1_plin] <= 1
 SizingConstr2_nopl: Rc[cond_br3,control_merge2] + Theta[0]
   - Theta_0[cond_br3,control_merge2] <= 1
 PipelineConstr1[mux2_plin,mux2_plout]: plRc[mux2] - Lu[mux2] <= 0
 PipelineConstr1[mux1_plin,mux1_plout]: plRc[mux1] - Lu[mux1] <= 0
 PipelineConstr1[subi1_plin,subi1_plout]: plRc[subi1] - Lu[subi1] <= 0
 PipelineConstr1[addi0_plin,addi0_plout]: plRc[addi0] - Lu[addi0] <= 0
 PipelineConstr1[addi1_plin,addi1_plout]: plRc[addi1] - Lu[addi1] <= 0
 PipelineConstr1[cmpi1_plin,cmpi1_plout]: plRc[cmpi1] - Lu[cmpi1] <= 0
 PipelineConstr1[return1_plin,return1_plout]: plRc[return1] - Lu[return1]
   <= 0
 PipelineConstr1[end0_plin,end0_plout]: plRc[end0] - Lu[end0] <= 0
 PipelineConstr2_conpl: Theta[0] - Theta_1[mc_load0_plin,mc_load0_plout]
   <= 0
 PipelineConstr3_conpl: Theta_1[mc_load0_plin,mc_load0_plout] <= 1
 PipelineConstr2_conpl: Theta[0] - Theta_1[mc_load1_plin,mc_load1_plout]
   <= 0
 PipelineConstr3_conpl: Theta_1[mc_load1_plin,mc_load1_plout] <= 1
 PipelineConstr2_conpl: 4 Theta[0] - Theta_1[muli0_plin,muli0_plout] <= 0
 PipelineConstr3_conpl: Theta_1[muli0_plin,muli0_plout] <= 4
 PipelineConstr3_varpl: - Lu[mux2] + Theta_1[mux2_plin,mux2_plout] <= 0
 PipelineConstr3_varpl: - Lu[mux1] + Theta_1[mux1_plin,mux1_plout] <= 0
 PipelineConstr3_varpl: - Lu[subi1] + Theta_1[subi1_plin,subi1_plout] <= 0
 PipelineConstr3_varpl: - Lu[addi0] + Theta_1[addi0_plin,addi0_plout] <= 0
 PipelineConstr3_varpl: - Lu[addi1] + Theta_1[addi1_plin,addi1_plout] <= 0
 PipelineConstr3_varpl: - Lu[cmpi1] + Theta_1[cmpi1_plin,cmpi1_plout] <= 0
 PathConstr3_varpl: - 0.706 plRc[mux2] + Tin[mux2_plin,mux2_plout]
   - Tout[extsi4,mux2_plin] + [ Lu[mux2] * Tin[mux2_plin,mux2_plout]
   - Lu[mux2] * Tout[extsi4,mux2_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux2] + Tin[mux2_plin,mux2_plout]
   - Tout[fork3,mux2_plin] + [ Lu[mux2] * Tin[mux2_plin,mux2_plout]
   - Lu[mux2] * Tout[fork3,mux2_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux2] + Tin[mux2_plin,mux2_plout]
   - Tout[cond_br0,mux2_plin] + [ Lu[mux2] * Tin[mux2_plin,mux2_plout]
   - Lu[mux2] * Tout[cond_br0,mux2_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux2] + Tin[mux2_plout,fork2]
   - Tout[mux2_plin,mux2_plout] + [ Lu[mux2] * Tin[mux2_plout,fork2]
   - Lu[mux2] * Tout[mux2_plin,mux2_plout] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux1] + Tin[mux1_plin,mux1_plout]
   - Tout[extsi5,mux1_plin] + [ Lu[mux1] * Tin[mux1_plin,mux1_plout]
   - Lu[mux1] * Tout[extsi5,mux1_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux1] + Tin[mux1_plin,mux1_plout]
   - Tout[fork3,mux1_plin] + [ Lu[mux1] * Tin[mux1_plin,mux1_plout]
   - Lu[mux1] * Tout[fork3,mux1_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux1] + Tin[mux1_plin,mux1_plout]
   - Tout[cond_br2,mux1_plin] + [ Lu[mux1] * Tin[mux1_plin,mux1_plout]
   - Lu[mux1] * Tout[cond_br2,mux1_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[mux1] + Tin[mux1_plout,addi0_plin]
   - Tout[mux1_plin,mux1_plout] + [ Lu[mux1] * Tin[mux1_plout,addi0_plin]
   - Lu[mux1] * Tout[mux1_plin,mux1_plout] ] >= 0.706
 PathConstr3_varpl: - 1.0235 plRc[subi1] + Tin[subi1_plin,subi1_plout]
   - Tout[extsi7,subi1_plin] + [ Lu[subi1] * Tin[subi1_plin,subi1_plout]
   - Lu[subi1] * Tout[extsi7,subi1_plin] ] >= 1.0235
 PathConstr3_varpl: - 1.0235 plRc[subi1] + Tin[subi1_plin,subi1_plout]
   - Tout[extsi9,subi1_plin] + [ Lu[subi1] * Tin[subi1_plin,subi1_plout]
   - Lu[subi1] * Tout[extsi9,subi1_plin] ] >= 1.0235
 PathConstr3_varpl: - 1.0235 plRc[subi1] + Tin[subi1_plout,extsi12]
   - Tout[subi1_plin,subi1_plout] + [ Lu[subi1] * Tin[subi1_plout,extsi12]
   - Lu[subi1] * Tout[subi1_plin,subi1_plout] ] >= 1.0235
 PathConstr3_varpl: - 1.1435 plRc[addi0] + Tin[addi0_plin,addi0_plout]
   - Tout[mux1_plout,addi0_plin] + [
   Lu[addi0] * Tin[addi0_plin,addi0_plout]
   - Lu[addi0] * Tout[mux1_plout,addi0_plin] ] >= 1.1435
 PathConstr3_varpl: - 1.1435 plRc[addi0] + Tin[addi0_plin,addi0_plout]
   - Tout[muli0_plout,addi0_plin] + [
   Lu[addi0] * Tin[addi0_plin,addi0_plout]
   - Lu[addi0] * Tout[muli0_plout,addi0_plin] ] >= 1.1435
 PathConstr3_varpl: - 1.1435 plRc[addi0] + Tin[addi0_plout,cond_br2]
   - Tout[addi0_plin,addi0_plout] + [ Lu[addi0] * Tin[addi0_plout,cond_br2]
   - Lu[addi0] * Tout[addi0_plin,addi0_plout] ] >= 1.1435
 PathConstr3_varpl: - 1.0235 plRc[addi1] + Tin[addi1_plin,addi1_plout]
   - Tout[extsi6,addi1_plin] + [ Lu[addi1] * Tin[addi1_plin,addi1_plout]
   - Lu[addi1] * Tout[extsi6,addi1_plin] ] >= 1.0235
 PathConstr3_varpl: - 1.0235 plRc[addi1] + Tin[addi1_plin,addi1_plout]
   - Tout[extsi11,addi1_plin] + [ Lu[addi1] * Tin[addi1_plin,addi1_plout]
   - Lu[addi1] * Tout[extsi11,addi1_plin] ] >= 1.0235
 PathConstr3_varpl: - 1.0235 plRc[addi1] + Tin[addi1_plout,fork4]
   - Tout[addi1_plin,addi1_plout] + [ Lu[addi1] * Tin[addi1_plout,fork4]
   - Lu[addi1] * Tout[addi1_plin,addi1_plout] ] >= 1.0235
 PathConstr3_varpl: - 0.904 plRc[cmpi1] + Tin[cmpi1_plin,cmpi1_plout]
   - Tout[extsi10,cmpi1_plin] + [ Lu[cmpi1] * Tin[cmpi1_plin,cmpi1_plout]
   - Lu[cmpi1] * Tout[extsi10,cmpi1_plin] ] >= 0.904
 PathConstr3_varpl: - 0.904 plRc[cmpi1] + Tin[cmpi1_plin,cmpi1_plout]
   - Tout[fork4,cmpi1_plin] + [ Lu[cmpi1] * Tin[cmpi1_plin,cmpi1_plout]
   - Lu[cmpi1] * Tout[fork4,cmpi1_plin] ] >= 0.904
 PathConstr3_varpl: - 0.904 plRc[cmpi1] + Tin[cmpi1_plout,fork5]
   - Tout[cmpi1_plin,cmpi1_plout] + [ Lu[cmpi1] * Tin[cmpi1_plout,fork5]
   - Lu[cmpi1] * Tout[cmpi1_plin,cmpi1_plout] ] >= 0.904
 PathConstr3_varpl: - 0.706 plRc[return1] + Tin[return1_plin,return1_plout]
   - Tout[cond_br2,return1_plin] + [
   Lu[return1] * Tin[return1_plin,return1_plout]
   - Lu[return1] * Tout[cond_br2,return1_plin] ] >= 0.706
 PathConstr3_varpl: - 0.706 plRc[return1] + Tin[return1_plout,end0_plin]
   - Tout[return1_plin,return1_plout] + [
   Lu[return1] * Tin[return1_plout,end0_plin]
   - Lu[return1] * Tout[return1_plin,return1_plout] ] >= 0.706
 PathConstr3_varpl: - 0.6985 plRc[end0] + Tin[end0_plin,end0_plout]
   - Tout[return1_plout,end0_plin] + [ Lu[end0] * Tin[end0_plin,end0_plout]
   - Lu[end0] * Tout[return1_plout,end0_plin] ] >= 0.6985
 PipelineConstr2_varpl: - Theta_1[mux2_plin,mux2_plout] + [
   Lu[mux2] * Theta[0] ] <= 0
 PipelineConstr2_varpl: - Theta_1[mux1_plin,mux1_plout] + [
   Lu[mux1] * Theta[0] ] <= 0
 PipelineConstr2_varpl: - Theta_1[subi1_plin,subi1_plout] + [
   Lu[subi1] * Theta[0] ] <= 0
 PipelineConstr2_varpl: - Theta_1[addi0_plin,addi0_plout] + [
   Lu[addi0] * Theta[0] ] <= 0
 PipelineConstr2_varpl: - Theta_1[addi1_plin,addi1_plout] + [
   Lu[addi1] * Theta[0] ] <= 0
 PipelineConstr2_varpl: - Theta_1[cmpi1_plin,cmpi1_plout] + [
   Lu[cmpi1] * Theta[0] ] <= 0
Bounds
 Lu[mux2] <= 10
 Lu[mux1] <= 10
 Lu[subi1] <= 10
 Lu[addi0] <= 10
 Lu[addi1] <= 10
 Lu[cmpi1] <= 10
 Lu[return1] <= 10
 Lu[end0] <= 10
 Theta[0] <= 1
Binaries
 Rc[start_0,fork0] Rc[fork0,constant1] Rc[fork0,control_merge2]
 Rc[constant1,fork1] Rc[fork1,extsi4] Rc[fork1,extsi5] Rc[extsi4,mux2_plin]
 Rc[extsi5,mux1_plin] Rc[mux2_plout,fork2] Rc[fork2,extsi6]
 Rc[fork2,extsi7] Rc[fork2,extsi8] Rc[extsi6,addi1_plin]
 Rc[extsi7,subi1_plin] Rc[extsi8,mc_load0_plin] Rc[mux1_plout,addi0_plin]
 Rc[control_merge2,fork3] Rc[control_merge2,cond_br3] Rc[fork3,mux2_plin]
 Rc[fork3,mux1_plin] Rc[source0,constant4] Rc[constant4,extsi9]
 Rc[extsi9,subi1_plin] Rc[source1,constant8] Rc[constant8,extsi10]
 Rc[extsi10,cmpi1_plin] Rc[source2,constant9] Rc[constant9,extsi11]
 Rc[extsi11,addi1_plin] Rc[mc_load0_plout,muli0_plin]
 Rc[subi1_plout,extsi12] Rc[extsi12,mc_load1_plin]
 Rc[mc_load1_plout,muli0_plin] Rc[muli0_plout,addi0_plin]
 Rc[addi0_plout,cond_br2] Rc[addi1_plout,fork4] Rc[fork4,trunci0]
 Rc[fork4,cmpi1_plin] Rc[trunci0,cond_br0] Rc[cmpi1_plout,fork5]
 Rc[fork5,cond_br0] Rc[fork5,cond_br2] Rc[fork5,cond_br3]
 Rc[cond_br0,mux2_plin] Rc[cond_br0,sink0] Rc[cond_br2,mux1_plin]
 Rc[cond_br2,return1_plin] Rc[cond_br3,control_merge2] Rc[cond_br3,sink1]
 Rc[return1_plout,end0_plin] plRc[mux2] plRc[mux1] plRc[subi1] plRc[addi0]
 plRc[addi1] plRc[cmpi1] plRc[return1] plRc[end0]
Generals
 Nc[start_0,fork0] Nc[fork0,constant1] Nc[fork0,control_merge2]
 Nc[constant1,fork1] Nc[fork1,extsi4] Nc[fork1,extsi5] Nc[extsi4,mux2_plin]
 Nc[extsi5,mux1_plin] Nc[mux2_plout,fork2] Nc[fork2,extsi6]
 Nc[fork2,extsi7] Nc[fork2,extsi8] Nc[extsi6,addi1_plin]
 Nc[extsi7,subi1_plin] Nc[extsi8,mc_load0_plin] Nc[mux1_plout,addi0_plin]
 Nc[control_merge2,fork3] Nc[control_merge2,cond_br3] Nc[fork3,mux2_plin]
 Nc[fork3,mux1_plin] Nc[source0,constant4] Nc[constant4,extsi9]
 Nc[extsi9,subi1_plin] Nc[source1,constant8] Nc[constant8,extsi10]
 Nc[extsi10,cmpi1_plin] Nc[source2,constant9] Nc[constant9,extsi11]
 Nc[extsi11,addi1_plin] Nc[mc_load0_plout,muli0_plin]
 Nc[subi1_plout,extsi12] Nc[extsi12,mc_load1_plin]
 Nc[mc_load1_plout,muli0_plin] Nc[muli0_plout,addi0_plin]
 Nc[addi0_plout,cond_br2] Nc[addi1_plout,fork4] Nc[fork4,trunci0]
 Nc[fork4,cmpi1_plin] Nc[trunci0,cond_br0] Nc[cmpi1_plout,fork5]
 Nc[fork5,cond_br0] Nc[fork5,cond_br2] Nc[fork5,cond_br3]
 Nc[cond_br0,mux2_plin] Nc[cond_br0,sink0] Nc[cond_br2,mux1_plin]
 Nc[cond_br2,return1_plin] Nc[cond_br3,control_merge2] Nc[cond_br3,sink1]
 Nc[return1_plout,end0_plin] Lu[mux2] Lu[mux1] Lu[subi1] Lu[addi0]
 Lu[addi1] Lu[cmpi1] Lu[return1] Lu[end0]
End
