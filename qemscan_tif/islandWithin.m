function [D_isl, D_Ptcl] = islandWithin(I_mtx,I_mtxM)

scf = 25/38;
numIls = max(max(I_mtxM));
nRow = size(I_mtx,1);

for G = 1:numIls
    elIsl = find(I_mtxM==G);
    numPix = length(elIsl);
    D_isl(G) = sqrt(numPix*(scf^2)*4/pi);
    [rc] = ind2rc(nRow,elIsl(1));
    rw = int32(rc(1));
    cl = int32(rc(2));
    ptclTag = I_mtx(rw,cl);
    elPtcl = find(I_mtx==ptclTag);
    numPix = length(elPtcl);
    D_Ptcl(G) = sqrt(numPix*(scf^2)*4/pi);
end

    