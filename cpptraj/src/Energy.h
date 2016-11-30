#ifndef INC_ENERGY_H
#define INC_ENERGY_H
#include "Topology.h"
#include "Timer.h"
/// Calculate energy/force from coordinates.
class Energy_Amber {
  public:
    typedef std::vector<double> Darray;
    Energy_Amber();

    double E_bond(Frame const&, Topology const&, CharMask const&);
    double E_angle(Frame const&, Topology const&, CharMask const&);
    double E_torsion(Frame const&, Topology const&, CharMask const&);
    double E_14_Nonbond(Frame const&, Topology const&, CharMask const&, double&);
    double E_Nonbond(Frame const&, Topology const&, AtomMask const&, double&);

    void SetDebug(int d) { debug_ = d; }
    void PrintTiming() const;
  private:
    double CalcBondEnergy(Frame const&, BondArray const&, BondParmArray const&,
                          CharMask const&);
    double CalcAngleEnergy(Frame const&, AngleArray const&, AngleParmArray const&,
                           CharMask const&);
    double CalcTorsionEnergy(Frame const&, DihedralArray const&, DihedralParmArray const&,
                             CharMask const&);
    double Calc_14_Energy(Frame const&, DihedralArray const&, DihedralParmArray const&,
                          Topology const&, CharMask const&, double&);

    static const double QFAC;
    int debug_;
    Timer time_bond_;
    Timer time_angle_;
    Timer time_tors_;
    Timer time_14_;
    Timer time_NB_;
};
#endif 
