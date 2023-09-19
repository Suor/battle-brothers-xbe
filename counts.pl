#!/usr/bin/perl
use v5.14;
use strict;
use warnings;

use Data::Dumper;

my @bgs = qw(
  arbalester     cartographer  falconer   locksmith      surgeon
  atilliator     champion      fletcher   master_archer  template
  barkeep        cobbler       folk_hero  myrmidon       torturer
  berserker      con_artist    gardener   outlander      town_watchman
  blacksmith     cook          hangman    painter
  bodyguard      dissenter     herbalist  pirate
  bounty_hunter  drifter       lancer     roofer
  carpenter      druid         leper      skirmisher
);
my $bgs_re = "(" . join("|", @bgs) . ")";

my @draft_files = glob "hackflows/world/*.nut";
our @ARGV = @draft_files;

my %cnt;
while (<ARGV>) {
  /$bgs_re/ && $cnt{$1}++;
}
print Dumper \%cnt;
